<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251008091453 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE cours (id INT AUTO_INCREMENT NOT NULL, id_instrument_id INT NOT NULL, id_type_cours_id INT NOT NULL, libelle VARCHAR(50) DEFAULT NULL, agemini INT DEFAULT NULL, agemaxi INT DEFAULT NULL, nbplaces INT DEFAULT NULL, INDEX IDX_FDCA8C9CB2D9CCF9 (id_instrument_id), INDEX IDX_FDCA8C9CD188E29 (id_type_cours_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE couter (id INT AUTO_INCREMENT NOT NULL, id_type_cours_id INT NOT NULL, id_tranche_id INT NOT NULL, montant INT DEFAULT NULL, INDEX IDX_8D58231BD188E29 (id_type_cours_id), INDEX IDX_8D58231B12E5EBE6 (id_tranche_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE eleves (id INT AUTO_INCREMENT NOT NULL, id_responsable_id INT NOT NULL, nom VARCHAR(50) DEFAULT NULL, prenom VARCHAR(50) DEFAULT NULL, date_naiss DATE DEFAULT NULL, INDEX IDX_383B09B16EA32074 (id_responsable_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE inscriptions (id INT AUTO_INCREMENT NOT NULL, id_eleve_id INT NOT NULL, id_cours_id INT NOT NULL, nb_paiements INT DEFAULT NULL, INDEX IDX_74E0281C5AB72B27 (id_eleve_id), INDEX IDX_74E0281C2E149425 (id_cours_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE instruments (id INT AUTO_INCREMENT NOT NULL, intitule VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE responsables (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) DEFAULT NULL, prenom VARCHAR(50) DEFAULT NULL, adresse VARCHAR(50) DEFAULT NULL, cpos VARCHAR(6) DEFAULT NULL, ville VARCHAR(50) DEFAULT NULL, email VARCHAR(100) DEFAULT NULL, quotient_familial INT DEFAULT NULL, tel1 VARCHAR(10) DEFAULT NULL, tel2 VARCHAR(10) DEFAULT NULL, tel3 VARCHAR(10) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tranches (id INT AUTO_INCREMENT NOT NULL, quotient_min INT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type_cours (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA8C9CB2D9CCF9 FOREIGN KEY (id_instrument_id) REFERENCES instruments (id)');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA8C9CD188E29 FOREIGN KEY (id_type_cours_id) REFERENCES type_cours (id)');
        $this->addSql('ALTER TABLE couter ADD CONSTRAINT FK_8D58231BD188E29 FOREIGN KEY (id_type_cours_id) REFERENCES type_cours (id)');
        $this->addSql('ALTER TABLE couter ADD CONSTRAINT FK_8D58231B12E5EBE6 FOREIGN KEY (id_tranche_id) REFERENCES tranches (id)');
        $this->addSql('ALTER TABLE eleves ADD CONSTRAINT FK_383B09B16EA32074 FOREIGN KEY (id_responsable_id) REFERENCES responsables (id)');
        $this->addSql('ALTER TABLE inscriptions ADD CONSTRAINT FK_74E0281C5AB72B27 FOREIGN KEY (id_eleve_id) REFERENCES eleves (id)');
        $this->addSql('ALTER TABLE inscriptions ADD CONSTRAINT FK_74E0281C2E149425 FOREIGN KEY (id_cours_id) REFERENCES cours (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA8C9CB2D9CCF9');
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA8C9CD188E29');
        $this->addSql('ALTER TABLE couter DROP FOREIGN KEY FK_8D58231BD188E29');
        $this->addSql('ALTER TABLE couter DROP FOREIGN KEY FK_8D58231B12E5EBE6');
        $this->addSql('ALTER TABLE eleves DROP FOREIGN KEY FK_383B09B16EA32074');
        $this->addSql('ALTER TABLE inscriptions DROP FOREIGN KEY FK_74E0281C5AB72B27');
        $this->addSql('ALTER TABLE inscriptions DROP FOREIGN KEY FK_74E0281C2E149425');
        $this->addSql('DROP TABLE cours');
        $this->addSql('DROP TABLE couter');
        $this->addSql('DROP TABLE eleves');
        $this->addSql('DROP TABLE inscriptions');
        $this->addSql('DROP TABLE instruments');
        $this->addSql('DROP TABLE responsables');
        $this->addSql('DROP TABLE tranches');
        $this->addSql('DROP TABLE type_cours');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
