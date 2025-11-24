<?php

namespace App\Tests\Controller;

use App\Entity\Eleve;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class EleveControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntityManagerInterface $manager;
    private EntityRepository $eleveRepository;
    private string $path = '/eleve/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->manager = static::getContainer()->get('doctrine')->getManager();
        $this->eleveRepository = $this->manager->getRepository(Eleve::class);

        foreach ($this->eleveRepository->findAll() as $object) {
            $this->manager->remove($object);
        }

        $this->manager->flush();
    }

    public function testIndex(): void
    {
        $this->client->followRedirects();
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Eleve index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first()->text());
    }

    public function testNew(): void
    {
        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'eleve[nom]' => 'Testing',
            'eleve[prenom]' => 'Testing',
            'eleve[numRue]' => 'Testing',
            'eleve[rue]' => 'Testing',
            'eleve[cpos]' => 'Testing',
            'eleve[ville]' => 'Testing',
            'eleve[tel]' => 'Testing',
            'eleve[mail]' => 'Testing',
            'eleve[tranche]' => 'Testing',
            'eleve[responsable]' => 'Testing',
        ]);

        self::assertResponseRedirects($this->path);

        self::assertSame(1, $this->eleveRepository->count([]));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Eleve();
        $fixture->setNom('My Title');
        $fixture->setPrenom('My Title');
        $fixture->setNumRue('My Title');
        $fixture->setRue('My Title');
        $fixture->setCpos('My Title');
        $fixture->setVille('My Title');
        $fixture->setTel('My Title');
        $fixture->setMail('My Title');
        $fixture->setTranche('My Title');
        $fixture->setResponsable('My Title');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Eleve');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Eleve();
        $fixture->setNom('Value');
        $fixture->setPrenom('Value');
        $fixture->setNumRue('Value');
        $fixture->setRue('Value');
        $fixture->setCpos('Value');
        $fixture->setVille('Value');
        $fixture->setTel('Value');
        $fixture->setMail('Value');
        $fixture->setTranche('Value');
        $fixture->setResponsable('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'eleve[nom]' => 'Something New',
            'eleve[prenom]' => 'Something New',
            'eleve[numRue]' => 'Something New',
            'eleve[rue]' => 'Something New',
            'eleve[cpos]' => 'Something New',
            'eleve[ville]' => 'Something New',
            'eleve[tel]' => 'Something New',
            'eleve[mail]' => 'Something New',
            'eleve[tranche]' => 'Something New',
            'eleve[responsable]' => 'Something New',
        ]);

        self::assertResponseRedirects('/eleve/');

        $fixture = $this->eleveRepository->findAll();

        self::assertSame('Something New', $fixture[0]->getNom());
        self::assertSame('Something New', $fixture[0]->getPrenom());
        self::assertSame('Something New', $fixture[0]->getNumRue());
        self::assertSame('Something New', $fixture[0]->getRue());
        self::assertSame('Something New', $fixture[0]->getCpos());
        self::assertSame('Something New', $fixture[0]->getVille());
        self::assertSame('Something New', $fixture[0]->getTel());
        self::assertSame('Something New', $fixture[0]->getMail());
        self::assertSame('Something New', $fixture[0]->getTranche());
        self::assertSame('Something New', $fixture[0]->getResponsable());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();
        $fixture = new Eleve();
        $fixture->setNom('Value');
        $fixture->setPrenom('Value');
        $fixture->setNumRue('Value');
        $fixture->setRue('Value');
        $fixture->setCpos('Value');
        $fixture->setVille('Value');
        $fixture->setTel('Value');
        $fixture->setMail('Value');
        $fixture->setTranche('Value');
        $fixture->setResponsable('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertResponseRedirects('/eleve/');
        self::assertSame(0, $this->eleveRepository->count([]));
    }
}
