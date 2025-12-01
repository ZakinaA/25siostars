<?php

namespace App\Tests\Controller;

use App\Entity\Compte;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class CompteControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntityManagerInterface $manager;
    private EntityRepository $compteRepository;
    private string $path = '/compte/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->manager = static::getContainer()->get('doctrine')->getManager();
        $this->compteRepository = $this->manager->getRepository(Compte::class);

        foreach ($this->compteRepository->findAll() as $object) {
            $this->manager->remove($object);
        }

        $this->manager->flush();
    }

    public function testIndex(): void
    {
        $this->client->followRedirects();
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Compte index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first()->text());
    }

    public function testNew(): void
    {
        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'compte[identifiant]' => 'Testing',
            'compte[roles]' => 'Testing',
            'compte[password]' => 'Testing',
        ]);

        self::assertResponseRedirects($this->path);

        self::assertSame(1, $this->compteRepository->count([]));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Compte();
        $fixture->setIdentifiant('My Title');
        $fixture->setRoles('My Title');
        $fixture->setPassword('My Title');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Compte');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Compte();
        $fixture->setIdentifiant('Value');
        $fixture->setRoles('Value');
        $fixture->setPassword('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'compte[identifiant]' => 'Something New',
            'compte[roles]' => 'Something New',
            'compte[password]' => 'Something New',
        ]);

        self::assertResponseRedirects('/compte/');

        $fixture = $this->compteRepository->findAll();

        self::assertSame('Something New', $fixture[0]->getIdentifiant());
        self::assertSame('Something New', $fixture[0]->getRoles());
        self::assertSame('Something New', $fixture[0]->getPassword());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();
        $fixture = new Compte();
        $fixture->setIdentifiant('Value');
        $fixture->setRoles('Value');
        $fixture->setPassword('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertResponseRedirects('/compte/');
        self::assertSame(0, $this->compteRepository->count([]));
    }
}
