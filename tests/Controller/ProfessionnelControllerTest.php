<?php

namespace App\Tests\Controller;

use App\Entity\Professionnel;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

final class ProfessionnelControllerTest extends WebTestCase
{
    private KernelBrowser $client;
    private EntityManagerInterface $manager;
    private EntityRepository $professionnelRepository;
    private string $path = '/professionnel/';

    protected function setUp(): void
    {
        $this->client = static::createClient();
        $this->manager = static::getContainer()->get('doctrine')->getManager();
        $this->professionnelRepository = $this->manager->getRepository(Professionnel::class);

        foreach ($this->professionnelRepository->findAll() as $object) {
            $this->manager->remove($object);
        }

        $this->manager->flush();
    }

    public function testIndex(): void
    {
        $this->client->followRedirects();
        $crawler = $this->client->request('GET', $this->path);

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Professionnel index');

        // Use the $crawler to perform additional assertions e.g.
        // self::assertSame('Some text on the page', $crawler->filter('.p')->first()->text());
    }

    public function testNew(): void
    {
        $this->markTestIncomplete();
        $this->client->request('GET', sprintf('%snew', $this->path));

        self::assertResponseStatusCodeSame(200);

        $this->client->submitForm('Save', [
            'professionnel[nom]' => 'Testing',
            'professionnel[numRue]' => 'Testing',
            'professionnel[rue]' => 'Testing',
            'professionnel[cpos]' => 'Testing',
            'professionnel[ville]' => 'Testing',
            'professionnel[tel]' => 'Testing',
            'professionnel[mail]' => 'Testing',
            'professionnel[metier]' => 'Testing',
        ]);

        self::assertResponseRedirects($this->path);

        self::assertSame(1, $this->professionnelRepository->count([]));
    }

    public function testShow(): void
    {
        $this->markTestIncomplete();
        $fixture = new Professionnel();
        $fixture->setNom('My Title');
        $fixture->setNumRue('My Title');
        $fixture->setRue('My Title');
        $fixture->setCpos('My Title');
        $fixture->setVille('My Title');
        $fixture->setTel('My Title');
        $fixture->setMail('My Title');
        $fixture->setMetier('My Title');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));

        self::assertResponseStatusCodeSame(200);
        self::assertPageTitleContains('Professionnel');

        // Use assertions to check that the properties are properly displayed.
    }

    public function testEdit(): void
    {
        $this->markTestIncomplete();
        $fixture = new Professionnel();
        $fixture->setNom('Value');
        $fixture->setNumRue('Value');
        $fixture->setRue('Value');
        $fixture->setCpos('Value');
        $fixture->setVille('Value');
        $fixture->setTel('Value');
        $fixture->setMail('Value');
        $fixture->setMetier('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s/edit', $this->path, $fixture->getId()));

        $this->client->submitForm('Update', [
            'professionnel[nom]' => 'Something New',
            'professionnel[numRue]' => 'Something New',
            'professionnel[rue]' => 'Something New',
            'professionnel[cpos]' => 'Something New',
            'professionnel[ville]' => 'Something New',
            'professionnel[tel]' => 'Something New',
            'professionnel[mail]' => 'Something New',
            'professionnel[metier]' => 'Something New',
        ]);

        self::assertResponseRedirects('/professionnel/');

        $fixture = $this->professionnelRepository->findAll();

        self::assertSame('Something New', $fixture[0]->getNom());
        self::assertSame('Something New', $fixture[0]->getNumRue());
        self::assertSame('Something New', $fixture[0]->getRue());
        self::assertSame('Something New', $fixture[0]->getCpos());
        self::assertSame('Something New', $fixture[0]->getVille());
        self::assertSame('Something New', $fixture[0]->getTel());
        self::assertSame('Something New', $fixture[0]->getMail());
        self::assertSame('Something New', $fixture[0]->getMetier());
    }

    public function testRemove(): void
    {
        $this->markTestIncomplete();
        $fixture = new Professionnel();
        $fixture->setNom('Value');
        $fixture->setNumRue('Value');
        $fixture->setRue('Value');
        $fixture->setCpos('Value');
        $fixture->setVille('Value');
        $fixture->setTel('Value');
        $fixture->setMail('Value');
        $fixture->setMetier('Value');

        $this->manager->persist($fixture);
        $this->manager->flush();

        $this->client->request('GET', sprintf('%s%s', $this->path, $fixture->getId()));
        $this->client->submitForm('Delete');

        self::assertResponseRedirects('/professionnel/');
        self::assertSame(0, $this->professionnelRepository->count([]));
    }
}
