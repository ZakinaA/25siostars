<?php

namespace App\Tests\Controller;

use App\Entity\Professeur;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class ProfesseurControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntityManagerInterface $manager;
    private EntityRepository $professeurRepository;
    private string $path = '/professeur/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->manager = static::getContainer()->get('doctrine')->getManager();
        $this->professeurRepository = $this->manager->getRepository(Professeur::class);

        foreach ($this->professeurRepository->findAll() as $object) {
            $this->manager->remove($object);
        }

        $this->manager->flush();
    }

    public function testIndex(): void
    {
        $this->client->followRedirects();
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Professeur index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first()->text());
    }

    public function testNew(): void
    {
        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'professeur[nom]' => 'Testing',
            'professeur[prenom]' => 'Testing',
            'professeur[numRue]' => 'Testing',
            'professeur[rue]' => 'Testing',
            'professeur[cpos]' => 'Testing',
            'professeur[ville]' => 'Testing',
            'professeur[tel]' => 'Testing',
            'professeur[mail]' => 'Testing',
            'professeur[typeInstruments]' => 'Testing',
        ]);

        self::assertResponseRedirects($this->path);

        self::assertSame(1, $this->professeurRepository->count([]));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Professeur();
        $fixture->setNom('My Title');
        $fixture->setPrenom('My Title');
        $fixture->setNumRue('My Title');
        $fixture->setRue('My Title');
        $fixture->setCpos('My Title');
        $fixture->setVille('My Title');
        $fixture->setTel('My Title');
        $fixture->setMail('My Title');
        $fixture->setTypeInstruments('My Title');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Professeur');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Professeur();
        $fixture->setNom('Value');
        $fixture->setPrenom('Value');
        $fixture->setNumRue('Value');
        $fixture->setRue('Value');
        $fixture->setCpos('Value');
        $fixture->setVille('Value');
        $fixture->setTel('Value');
        $fixture->setMail('Value');
        $fixture->setTypeInstruments('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'professeur[nom]' => 'Something New',
            'professeur[prenom]' => 'Something New',
            'professeur[numRue]' => 'Something New',
            'professeur[rue]' => 'Something New',
            'professeur[cpos]' => 'Something New',
            'professeur[ville]' => 'Something New',
            'professeur[tel]' => 'Something New',
            'professeur[mail]' => 'Something New',
            'professeur[typeInstruments]' => 'Something New',
        ]);

        self::assertResponseRedirects('/professeur/');

        $fixture = $this->professeurRepository->findAll();

        self::assertSame('Something New', $fixture[0]->getNom());
        self::assertSame('Something New', $fixture[0]->getPrenom());
        self::assertSame('Something New', $fixture[0]->getNumRue());
        self::assertSame('Something New', $fixture[0]->getRue());
        self::assertSame('Something New', $fixture[0]->getCpos());
        self::assertSame('Something New', $fixture[0]->getVille());
        self::assertSame('Something New', $fixture[0]->getTel());
        self::assertSame('Something New', $fixture[0]->getMail());
        self::assertSame('Something New', $fixture[0]->getTypeInstruments());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();
        $fixture = new Professeur();
        $fixture->setNom('Value');
        $fixture->setPrenom('Value');
        $fixture->setNumRue('Value');
        $fixture->setRue('Value');
        $fixture->setCpos('Value');
        $fixture->setVille('Value');
        $fixture->setTel('Value');
        $fixture->setMail('Value');
        $fixture->setTypeInstruments('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertResponseRedirects('/professeur/');
        self::assertSame(0, $this->professeurRepository->count([]));
    }
}
