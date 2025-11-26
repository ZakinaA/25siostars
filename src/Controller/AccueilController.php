<?php

namespace App\Controller;

use App\Entity\Cours;
use App\Form\CoursType;
use App\Repository\CoursRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\TypeInstrumentRepository;

#[Route('/accueil')]
final class AccueilController extends AbstractController
{
    #[Route(name: 'app_accueil_index', methods: ['GET'])]
    public function index(
    CoursRepository $coursRepository,
    TypeInstrumentRepository $typeInstrumentRepo
    ): Response
    {
    // On récupère tous les types d'instrument existants en base
    $types = $typeInstrumentRepo->findAll();

    $coursParInstrument = [];

    foreach ($types as $type) {
        $cours = $coursRepository->findBy(
            ['typeInstrument' => $type],
            ['id' => 'ASC']
        );

        // clé = nom du type d’instrument
        $coursParInstrument[$type->getLibelle()] = $cours;
    }

    foreach ($types as $typeInstrument) {
    $cours = $coursRepository->findBy(
        [
            'typeInstrument' => $typeInstrument,
            'type' => 2   // ID du type Collectif
        ],
        ['id' => 'ASC']
    );

    $coursParInstrument[$typeInstrument->getLibelle()] = $cours;
}

    return $this->render('accueil/index.html.twig', [
        'coursParInstrument' => $coursParInstrument,
    ]);
}


    #[Route('/new', name: 'app_accueil_new', methods: ['GET', 'POST'])]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $cour = new Cours();
        $form = $this->createForm(CoursType::class, $cour);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($cour);
            $entityManager->flush();

            return $this->redirectToRoute('app_accueil_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('accueil/new.html.twig', [
            'cour' => $cour,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_accueil_show', methods: ['GET'])]
    public function show(Cours $cour): Response
    {
        return $this->render('accueil/show.html.twig', [
            'cour' => $cour,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_accueil_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Cours $cour, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(CoursType::class, $cour);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('app_accueil_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->render('accueil/edit.html.twig', [
            'cour' => $cour,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_accueil_delete', methods: ['POST'])]
    public function delete(Request $request, Cours $cour, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$cour->getId(), $request->getPayload()->getString('_token'))) {
            $entityManager->remove($cour);
            $entityManager->flush();
        }

        return $this->redirectToRoute('app_accueil_index', [], Response::HTTP_SEE_OTHER);
    }
}
