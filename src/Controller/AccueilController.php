<?php

namespace App\Controller;

use App\Entity\Cours;
use App\Repository\CoursRepository;
use App\Repository\TypeInstrumentRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/accueil')]
class AccueilController extends AbstractController
{
    #[Route(name: 'app_accueil_index', methods: ['GET'])]
    public function index(
        Request $request,
        CoursRepository $coursRepository,
        TypeInstrumentRepository $typeInstrumentRepository
    ): Response
    {
        $searchInstrument = $request->query->get('instrument');
        $coursParInstrument = [];

        if ($searchInstrument) {
            // Recherche par nom d'instrument uniquement pour les cours collectifs (type.id = 2)
            $qb = $coursRepository->createQueryBuilder('c')
                ->join('c.typeInstrument', 'ti')
                ->join('c.type', 't')
                ->where('ti.libelle LIKE :search')
                ->andWhere('t.id = 2')
                ->setParameter('search', '%'.$searchInstrument.'%')
                ->orderBy('c.id', 'ASC');

            $results = $qb->getQuery()->getResult();

            if ($results) {
                $instrumentName = $results[0]->getTypeInstrumentLibelle();
                $coursParInstrument[$instrumentName] = $results;
            }
        } else {
            // Tous les instruments avec leurs cours collectifs
            $typeInstruments = $typeInstrumentRepository->findAll();

            foreach ($typeInstruments as $instrument) {
                $cours = $coursRepository->createQueryBuilder('c')
                    ->join('c.typeInstrument', 'ti')
                    ->join('c.type', 't')
                    ->where('ti.id = :instrumentId')
                    ->andWhere('t.id = 2')
                    ->setParameter('instrumentId', $instrument->getId())
                    ->orderBy('c.id', 'ASC')
                    ->getQuery()
                    ->getResult();

                $coursParInstrument[$instrument->getLibelle()] = $cours;
            }
        }

        return $this->render('accueil/index.html.twig', [
            'coursParInstrument' => $coursParInstrument,
            'searchInstrument' => $searchInstrument,
        ]);
    }
}
