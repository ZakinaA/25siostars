<?php

namespace App\Controller;

use App\Entity\Compte;
use App\Form\CompteType;
use App\Repository\CompteRepository;
use App\Repository\EleveRepository;
use App\Repository\InscriptionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/compte')]
final class CompteController extends AbstractController
{

    #[Route('/gestion', name: 'app_compte_index', methods: ['GET'])]
    public function index(CompteRepository $compteRepository): Response
    {
        return $this->render('compte/index.html.twig', [
            'comptes' => $compteRepository->findAll(),
        ]);
    }

    #[Route('/show', name: 'app_compte_show', methods: ['GET'])]
    public function show(EleveRepository $eleveRepo, InscriptionRepository $inscriptionRepo): Response
    {
        // 1. Récupère le compte connecté
        $compte = $this->getUser();

        if (!$compte) {
            return $this->redirectToRoute('app_login');
        }

        // 2. Récupère l'élève lié (même ID dans ta base)
        // Note de Maxence: ça se voit que ça a utilisé ChatGPT là
        $eleve = $eleveRepo->find($compte->getId());

        // 3. Récupérer les inscriptions de cet élève
        $inscriptions = [];
        $cours = [];

        if ($eleve) {
            $inscriptions = $inscriptionRepo->findBy(['eleve' => $eleve]);

            // 4. Extraire les cours
            foreach ($inscriptions as $inscription) {
                if ($inscription->getCours()) {
                    $cours[] = $inscription->getCours();
                }
            }
        }

        if ($compte->getRoles()[0] == "role_eleve") {
            return $this->render('compte/show-eleve.html.twig', [
                'compte'      => $compte,
                'eleve'       => $eleve,
                'cours'       => $cours,
                'inscriptions'=> $inscriptions,
            ]);
        } elseif ($compte->getRoles()[0] == "role_professeur") {
            return $this->render('compte/show-professeur.html.twig', [
                'compte'      => $compte,
            ]);
        } elseif ($compte->getRoles()[0] == "role_gestionnaire") {
            return $this->render('compte/show-gestionnaire.html.twig', [
                'compte'      => $compte,
            ]);
        }
    }

    #[Route('/{id}/edit', name: 'app_compte_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Compte $compte, EntityManagerInterface $entityManager, UserPasswordHasherInterface $userPasswordHasher): Response
    {
        $form = $this->createForm(CompteType::class, $compte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            /** @var string $plainPassword */
            $plainPassword = $form->get('plainPassword')->getData();

            // encode the plain password
            $compte->setPassword($userPasswordHasher->hashPassword($compte, $plainPassword));

            $entityManager->flush();

            return $this->redirectToRoute('app_compte_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('compte/edit.html.twig', [
            'compte' => $compte,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_compte_delete', methods: ['POST'])]
    public function delete(Request $request, Compte $compte, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$compte->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($compte);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_compte_index', [], Response::HTTP_SEE_OTHER);
    }
}
