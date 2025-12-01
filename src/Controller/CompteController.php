<?php

namespace App\Controller;

use App\Entity\Compte;
use App\Form\CompteType;
use App\Repository\CompteRepository;
use App\Repository\EleveRepository;
use App\Repository\InscriptionRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

#[Route('/compte')]
final class CompteController extends AbstractController
{
    #[Route(name: 'app_compte_index', methods: ['GET'])]
    public function index(EleveRepository $eleveRepo, InscriptionRepository $inscriptionRepo): Response
    {
        // 1. Récupère le compte connecté
        $compte = $this->getUser();

        if (!$compte) {
            return $this->redirectToRoute('app_login');
        }

        // 2. Récupère l'élève lié (même ID dans ta base)
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

        return $this->render('compte/index.html.twig', [
            'compte'      => $compte,
            'eleve'       => $eleve,
            'cours'       => $cours,
            'inscriptions'=> $inscriptions,
        ]);
    }

    #[Route('/new', name: 'app_compte_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $compte = new Compte();
        $form = $this->createForm(CompteType::class, $compte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($compte);
            $entityManager->flush();

            return $this->redirectToRoute('app_compte_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('compte/new.html.twig', [
            'compte' => $compte,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_compte_show', methods: ['GET'])]
    public function show(Compte $compte): Response
    {
        return $this->render('compte/show.html.twig', [
            'compte' => $compte,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_compte_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Compte $compte, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(CompteType::class, $compte);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
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
