<?php

namespace App\Tests\Controller;

use App\Entity\Instrument;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class InstrumentControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntityManagerInterface $manager;
    private EntityRepository $instrumentRepository;
    private string $path = '/instrument/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->manager = static::getContainer()->get('doctrine')->getManager();
        $this->instrumentRepository = $this->manager->getRepository(Instrument::class);

        foreach ($this->instrumentRepository->findAll() as $object) {
            $this->manager->remove($object);
        }

        $this->manager->flush();
    }

    public function testIndex(): void
    {
        $this->client->followRedirects();
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Instrument index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first()->text());
    }

    public function testNew(): void
    {
        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'instrument[numSerie]' => 'Testing',
            'instrument[dateAchat]' => 'Testing',
            'instrument[prixAchat]' => 'Testing',
            'instrument[utilisation]' => 'Testing',
            'instrument[cheminImage]' => 'Testing',
            'instrument[idCouleur]' => 'Testing',
            'instrument[idMarque]' => 'Testing',
            'instrument[idTypeInstrument]' => 'Testing',
        ]);

        self::assertResponseRedirects($this->path);

        self::assertSame(1, $this->instrumentRepository->count([]));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Instrument();
        $fixture->setNumSerie('My Title');
        $fixture->setDateAchat('My Title');
        $fixture->setPrixAchat('My Title');
        $fixture->setUtilisation('My Title');
        $fixture->setCheminImage('My Title');
        $fixture->setIdCouleur('My Title');
        $fixture->setIdMarque('My Title');
        $fixture->setIdTypeInstrument('My Title');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Instrument');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Instrument();
        $fixture->setNumSerie('Value');
        $fixture->setDateAchat('Value');
        $fixture->setPrixAchat('Value');
        $fixture->setUtilisation('Value');
        $fixture->setCheminImage('Value');
        $fixture->setIdCouleur('Value');
        $fixture->setIdMarque('Value');
        $fixture->setIdTypeInstrument('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'instrument[numSerie]' => 'Something New',
            'instrument[dateAchat]' => 'Something New',
            'instrument[prixAchat]' => 'Something New',
            'instrument[utilisation]' => 'Something New',
            'instrument[cheminImage]' => 'Something New',
            'instrument[idCouleur]' => 'Something New',
            'instrument[idMarque]' => 'Something New',
            'instrument[idTypeInstrument]' => 'Something New',
        ]);

        self::assertResponseRedirects('/instrument/');

        $fixture = $this->instrumentRepository->findAll();

        self::assertSame('Something New', $fixture[0]->getNumSerie());
        self::assertSame('Something New', $fixture[0]->getDateAchat());
        self::assertSame('Something New', $fixture[0]->getPrixAchat());
        self::assertSame('Something New', $fixture[0]->getUtilisation());
        self::assertSame('Something New', $fixture[0]->getCheminImage());
        self::assertSame('Something New', $fixture[0]->getIdCouleur());
        self::assertSame('Something New', $fixture[0]->getIdMarque());
        self::assertSame('Something New', $fixture[0]->getIdTypeInstrument());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();
        $fixture = new Instrument();
        $fixture->setNumSerie('Value');
        $fixture->setDateAchat('Value');
        $fixture->setPrixAchat('Value');
        $fixture->setUtilisation('Value');
        $fixture->setCheminImage('Value');
        $fixture->setIdCouleur('Value');
        $fixture->setIdMarque('Value');
        $fixture->setIdTypeInstrument('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertResponseRedirects('/instrument/');
        self::assertSame(0, $this->instrumentRepository->count([]));
    }
}
