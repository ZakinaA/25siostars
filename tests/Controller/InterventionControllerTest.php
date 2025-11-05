<?php

namespace App\Tests\Controller;

use App\Entity\Intervention;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class InterventionControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntityManagerInterface $manager;
    private EntityRepository $interventionRepository;
    private string $path = '/intervention/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->manager = static::getContainer()->get('doctrine')->getManager();
        $this->interventionRepository = $this->manager->getRepository(Intervention::class);

        foreach ($this->interventionRepository->findAll() as $object) {
            $this->manager->remove($object);
        }

        $this->manager->flush();
    }

    public function testIndex(): void
    {
        $this->client->followRedirects();
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Intervention index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first()->text());
    }

    public function testNew(): void
    {
        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'intervention[dateDebut]' => 'Testing',
            'intervention[dateFin]' => 'Testing',
            'intervention[descriptif]' => 'Testing',
            'intervention[prix]' => 'Testing',
            'intervention[quotite]' => 'Testing',
            'intervention[professionnel]' => 'Testing',
            'intervention[instrument]' => 'Testing',
        ]);

        self::assertResponseRedirects($this->path);

        self::assertSame(1, $this->interventionRepository->count([]));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Intervention();
        $fixture->setDateDebut('My Title');
        $fixture->setDateFin('My Title');
        $fixture->setDescriptif('My Title');
        $fixture->setPrix('My Title');
        $fixture->setQuotite('My Title');
        $fixture->setProfessionnel('My Title');
        $fixture->setInstrument('My Title');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Intervention');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Intervention();
        $fixture->setDateDebut('Value');
        $fixture->setDateFin('Value');
        $fixture->setDescriptif('Value');
        $fixture->setPrix('Value');
        $fixture->setQuotite('Value');
        $fixture->setProfessionnel('Value');
        $fixture->setInstrument('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'intervention[dateDebut]' => 'Something New',
            'intervention[dateFin]' => 'Something New',
            'intervention[descriptif]' => 'Something New',
            'intervention[prix]' => 'Something New',
            'intervention[quotite]' => 'Something New',
            'intervention[professionnel]' => 'Something New',
            'intervention[instrument]' => 'Something New',
        ]);

        self::assertResponseRedirects('/intervention/');

        $fixture = $this->interventionRepository->findAll();

        self::assertSame('Something New', $fixture[0]->getDateDebut());
        self::assertSame('Something New', $fixture[0]->getDateFin());
        self::assertSame('Something New', $fixture[0]->getDescriptif());
        self::assertSame('Something New', $fixture[0]->getPrix());
        self::assertSame('Something New', $fixture[0]->getQuotite());
        self::assertSame('Something New', $fixture[0]->getProfessionnel());
        self::assertSame('Something New', $fixture[0]->getInstrument());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();
        $fixture = new Intervention();
        $fixture->setDateDebut('Value');
        $fixture->setDateFin('Value');
        $fixture->setDescriptif('Value');
        $fixture->setPrix('Value');
        $fixture->setQuotite('Value');
        $fixture->setProfessionnel('Value');
        $fixture->setInstrument('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertResponseRedirects('/intervention/');
        self::assertSame(0, $this->interventionRepository->count([]));
    }
}
