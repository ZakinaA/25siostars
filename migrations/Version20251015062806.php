<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251015062806 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE accessoire (id INT AUTO_INCREMENT NOT NULL, instrument_id INT DEFAULT NULL, libelle VARCHAR(50) DEFAULT NULL, INDEX IDX_8FD026ACF11D9C (instrument_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE classe_instrument (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE contrat_pret (id INT AUTO_INCREMENT NOT NULL, instrument_id INT NOT NULL, id_eleve_id INT NOT NULL, date_debut DATE NOT NULL, date_fin DATE NOT NULL, attestation_assurance VARCHAR(100) NOT NULL, etat_detaille_debut VARCHAR(100) NOT NULL, etatdetaille_retour VARCHAR(100) NOT NULL, INDEX IDX_1FB84C67CF11D9C (instrument_id), INDEX IDX_1FB84C675AB72B27 (id_eleve_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE couleur (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE cours (id INT AUTO_INCREMENT NOT NULL, type_id INT DEFAULT NULL, jour_id INT DEFAULT NULL, id_professeur_id INT NOT NULL, id_type_instrument_id INT NOT NULL, libelle VARCHAR(100) NOT NULL, age_mini DOUBLE PRECISION NOT NULL, age_maxi DOUBLE PRECISION NOT NULL, nb_palces INT NOT NULL, heure_debut TIME NOT NULL, heure_fin TIME NOT NULL, INDEX IDX_FDCA8C9CC54C8C93 (type_id), INDEX IDX_FDCA8C9C220C6AD0 (jour_id), INDEX IDX_FDCA8C9C49AFF8C (id_professeur_id), INDEX IDX_FDCA8C9CFF3E1806 (id_type_instrument_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE eleve (id INT AUTO_INCREMENT NOT NULL, tranche_id INT DEFAULT NULL, responsable_id INT DEFAULT NULL, nom VARCHAR(100) NOT NULL, prenom VARCHAR(100) NOT NULL, num_rue INT NOT NULL, rue VARCHAR(100) NOT NULL, copos VARCHAR(100) NOT NULL, ville VARCHAR(100) NOT NULL, tel VARCHAR(10) NOT NULL, mail VARCHAR(100) NOT NULL, INDEX IDX_ECA105F7B76F6B31 (tranche_id), INDEX IDX_ECA105F753C59D72 (responsable_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE inscription (id INT AUTO_INCREMENT NOT NULL, cours_id INT DEFAULT NULL, eleve_id INT DEFAULT NULL, date_inscription DATE NOT NULL, INDEX IDX_5E90F6D67ECF78B0 (cours_id), INDEX IDX_5E90F6D6A6CC7B2 (eleve_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE instrument (id INT AUTO_INCREMENT NOT NULL, id_marque_id INT NOT NULL, id_type_instrument_id INT NOT NULL, num_serie INT DEFAULT NULL, date_achat DATE DEFAULT NULL, prix_achat INT DEFAULT NULL, utilisation VARCHAR(50) DEFAULT NULL, chemin_image VARCHAR(200) DEFAULT NULL, INDEX IDX_3CBF69DDC8120595 (id_marque_id), INDEX IDX_3CBF69DDFF3E1806 (id_type_instrument_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE instrument_couleur (instrument_id INT NOT NULL, couleur_id INT NOT NULL, INDEX IDX_443EF844CF11D9C (instrument_id), INDEX IDX_443EF844C31BA576 (couleur_id), PRIMARY KEY(instrument_id, couleur_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE intervention (id INT AUTO_INCREMENT NOT NULL, professionnel_id INT NOT NULL, instrument_id INT NOT NULL, date_debut DATE NOT NULL, date_fin DATE NOT NULL, descriptif VARCHAR(255) NOT NULL, prix DOUBLE PRECISION NOT NULL, quotite DOUBLE PRECISION NOT NULL, profressionnel DOUBLE PRECISION NOT NULL, INDEX IDX_D11814AB8A49CC82 (professionnel_id), INDEX IDX_D11814ABCF11D9C (instrument_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE jour (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(25) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE marque (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(50) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE metier (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(150) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE paiement (id INT AUTO_INCREMENT NOT NULL, inscription_id INT DEFAULT NULL, montant INT NOT NULL, date_paiement DATE NOT NULL, INDEX IDX_B1DC7A1E5DAC5993 (inscription_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE professeur (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(100) DEFAULT NULL, prenom VARCHAR(100) DEFAULT NULL, num_rue INT DEFAULT NULL, rue VARCHAR(100) DEFAULT NULL, cpos INT DEFAULT NULL, ville VARCHAR(100) DEFAULT NULL, tel VARCHAR(10) DEFAULT NULL, mail VARCHAR(150) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE professionnel (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(100) NOT NULL, num_rue DOUBLE PRECISION NOT NULL, rue VARCHAR(150) NOT NULL, copos DOUBLE PRECISION NOT NULL, ville VARCHAR(100) NOT NULL, tel DOUBLE PRECISION NOT NULL, mail VARCHAR(150) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE professionnel_metier (professionnel_id INT NOT NULL, metier_id INT NOT NULL, INDEX IDX_715C73CA8A49CC82 (professionnel_id), INDEX IDX_715C73CAED16FA20 (metier_id), PRIMARY KEY(professionnel_id, metier_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE responsable (id INT AUTO_INCREMENT NOT NULL, tranche_id INT DEFAULT NULL, nom VARCHAR(100) NOT NULL, prenom VARCHAR(100) NOT NULL, num_rue INT NOT NULL, rue VARCHAR(100) NOT NULL, copos VARCHAR(100) NOT NULL, ville VARCHAR(100) NOT NULL, tel VARCHAR(10) NOT NULL, mail VARCHAR(100) NOT NULL, INDEX IDX_52520D07B76F6B31 (tranche_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tarif (id INT AUTO_INCREMENT NOT NULL, montant DOUBLE PRECISION NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE tranche (id INT AUTO_INCREMENT NOT NULL, tarif_id INT DEFAULT NULL, libelle VARCHAR(100) NOT NULL, quotient_mini DOUBLE PRECISION NOT NULL, INDEX IDX_66675840357C0A59 (tarif_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type (id INT AUTO_INCREMENT NOT NULL, tarif_id INT DEFAULT NULL, nom VARCHAR(100) NOT NULL, INDEX IDX_8CDE5729357C0A59 (tarif_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type_instrument (id INT AUTO_INCREMENT NOT NULL, id_classe_instrument_id INT NOT NULL, libelle VARCHAR(50) DEFAULT NULL, INDEX IDX_21BCBFF8C2776E15 (id_classe_instrument_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE type_instrument_professeur (type_instrument_id INT NOT NULL, professeur_id INT NOT NULL, INDEX IDX_A39FA53D7C1CAAA9 (type_instrument_id), INDEX IDX_A39FA53DBAB22EE9 (professeur_id), PRIMARY KEY(type_instrument_id, professeur_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE accessoire ADD CONSTRAINT FK_8FD026ACF11D9C FOREIGN KEY (instrument_id) REFERENCES instrument (id)');
        $this->addSql('ALTER TABLE contrat_pret ADD CONSTRAINT FK_1FB84C67CF11D9C FOREIGN KEY (instrument_id) REFERENCES instrument (id)');
        $this->addSql('ALTER TABLE contrat_pret ADD CONSTRAINT FK_1FB84C675AB72B27 FOREIGN KEY (id_eleve_id) REFERENCES eleve (id)');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA8C9CC54C8C93 FOREIGN KEY (type_id) REFERENCES type (id)');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA8C9C220C6AD0 FOREIGN KEY (jour_id) REFERENCES jour (id)');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA8C9C49AFF8C FOREIGN KEY (id_professeur_id) REFERENCES professeur (id)');
        $this->addSql('ALTER TABLE cours ADD CONSTRAINT FK_FDCA8C9CFF3E1806 FOREIGN KEY (id_type_instrument_id) REFERENCES type_instrument (id)');
        $this->addSql('ALTER TABLE eleve ADD CONSTRAINT FK_ECA105F7B76F6B31 FOREIGN KEY (tranche_id) REFERENCES tranche (id)');
        $this->addSql('ALTER TABLE eleve ADD CONSTRAINT FK_ECA105F753C59D72 FOREIGN KEY (responsable_id) REFERENCES responsable (id)');
        $this->addSql('ALTER TABLE inscription ADD CONSTRAINT FK_5E90F6D67ECF78B0 FOREIGN KEY (cours_id) REFERENCES cours (id)');
        $this->addSql('ALTER TABLE inscription ADD CONSTRAINT FK_5E90F6D6A6CC7B2 FOREIGN KEY (eleve_id) REFERENCES eleve (id)');
        $this->addSql('ALTER TABLE instrument ADD CONSTRAINT FK_3CBF69DDC8120595 FOREIGN KEY (id_marque_id) REFERENCES marque (id)');
        $this->addSql('ALTER TABLE instrument ADD CONSTRAINT FK_3CBF69DDFF3E1806 FOREIGN KEY (id_type_instrument_id) REFERENCES type_instrument (id)');
        $this->addSql('ALTER TABLE instrument_couleur ADD CONSTRAINT FK_443EF844CF11D9C FOREIGN KEY (instrument_id) REFERENCES instrument (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE instrument_couleur ADD CONSTRAINT FK_443EF844C31BA576 FOREIGN KEY (couleur_id) REFERENCES couleur (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE intervention ADD CONSTRAINT FK_D11814AB8A49CC82 FOREIGN KEY (professionnel_id) REFERENCES professionnel (id)');
        $this->addSql('ALTER TABLE intervention ADD CONSTRAINT FK_D11814ABCF11D9C FOREIGN KEY (instrument_id) REFERENCES instrument (id)');
        $this->addSql('ALTER TABLE paiement ADD CONSTRAINT FK_B1DC7A1E5DAC5993 FOREIGN KEY (inscription_id) REFERENCES inscription (id)');
        $this->addSql('ALTER TABLE professionnel_metier ADD CONSTRAINT FK_715C73CA8A49CC82 FOREIGN KEY (professionnel_id) REFERENCES professionnel (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE professionnel_metier ADD CONSTRAINT FK_715C73CAED16FA20 FOREIGN KEY (metier_id) REFERENCES metier (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE responsable ADD CONSTRAINT FK_52520D07B76F6B31 FOREIGN KEY (tranche_id) REFERENCES tranche (id)');
        $this->addSql('ALTER TABLE tranche ADD CONSTRAINT FK_66675840357C0A59 FOREIGN KEY (tarif_id) REFERENCES tarif (id)');
        $this->addSql('ALTER TABLE type ADD CONSTRAINT FK_8CDE5729357C0A59 FOREIGN KEY (tarif_id) REFERENCES tarif (id)');
        $this->addSql('ALTER TABLE type_instrument ADD CONSTRAINT FK_21BCBFF8C2776E15 FOREIGN KEY (id_classe_instrument_id) REFERENCES classe_instrument (id)');
        $this->addSql('ALTER TABLE type_instrument_professeur ADD CONSTRAINT FK_A39FA53D7C1CAAA9 FOREIGN KEY (type_instrument_id) REFERENCES type_instrument (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE type_instrument_professeur ADD CONSTRAINT FK_A39FA53DBAB22EE9 FOREIGN KEY (professeur_id) REFERENCES professeur (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE accessoire DROP FOREIGN KEY FK_8FD026ACF11D9C');
        $this->addSql('ALTER TABLE contrat_pret DROP FOREIGN KEY FK_1FB84C67CF11D9C');
        $this->addSql('ALTER TABLE contrat_pret DROP FOREIGN KEY FK_1FB84C675AB72B27');
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA8C9CC54C8C93');
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA8C9C220C6AD0');
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA8C9C49AFF8C');
        $this->addSql('ALTER TABLE cours DROP FOREIGN KEY FK_FDCA8C9CFF3E1806');
        $this->addSql('ALTER TABLE eleve DROP FOREIGN KEY FK_ECA105F7B76F6B31');
        $this->addSql('ALTER TABLE eleve DROP FOREIGN KEY FK_ECA105F753C59D72');
        $this->addSql('ALTER TABLE inscription DROP FOREIGN KEY FK_5E90F6D67ECF78B0');
        $this->addSql('ALTER TABLE inscription DROP FOREIGN KEY FK_5E90F6D6A6CC7B2');
        $this->addSql('ALTER TABLE instrument DROP FOREIGN KEY FK_3CBF69DDC8120595');
        $this->addSql('ALTER TABLE instrument DROP FOREIGN KEY FK_3CBF69DDFF3E1806');
        $this->addSql('ALTER TABLE instrument_couleur DROP FOREIGN KEY FK_443EF844CF11D9C');
        $this->addSql('ALTER TABLE instrument_couleur DROP FOREIGN KEY FK_443EF844C31BA576');
        $this->addSql('ALTER TABLE intervention DROP FOREIGN KEY FK_D11814AB8A49CC82');
        $this->addSql('ALTER TABLE intervention DROP FOREIGN KEY FK_D11814ABCF11D9C');
        $this->addSql('ALTER TABLE paiement DROP FOREIGN KEY FK_B1DC7A1E5DAC5993');
        $this->addSql('ALTER TABLE professionnel_metier DROP FOREIGN KEY FK_715C73CA8A49CC82');
        $this->addSql('ALTER TABLE professionnel_metier DROP FOREIGN KEY FK_715C73CAED16FA20');
        $this->addSql('ALTER TABLE responsable DROP FOREIGN KEY FK_52520D07B76F6B31');
        $this->addSql('ALTER TABLE tranche DROP FOREIGN KEY FK_66675840357C0A59');
        $this->addSql('ALTER TABLE type DROP FOREIGN KEY FK_8CDE5729357C0A59');
        $this->addSql('ALTER TABLE type_instrument DROP FOREIGN KEY FK_21BCBFF8C2776E15');
        $this->addSql('ALTER TABLE type_instrument_professeur DROP FOREIGN KEY FK_A39FA53D7C1CAAA9');
        $this->addSql('ALTER TABLE type_instrument_professeur DROP FOREIGN KEY FK_A39FA53DBAB22EE9');
        $this->addSql('DROP TABLE accessoire');
        $this->addSql('DROP TABLE classe_instrument');
        $this->addSql('DROP TABLE contrat_pret');
        $this->addSql('DROP TABLE couleur');
        $this->addSql('DROP TABLE cours');
        $this->addSql('DROP TABLE eleve');
        $this->addSql('DROP TABLE inscription');
        $this->addSql('DROP TABLE instrument');
        $this->addSql('DROP TABLE instrument_couleur');
        $this->addSql('DROP TABLE intervention');
        $this->addSql('DROP TABLE jour');
        $this->addSql('DROP TABLE marque');
        $this->addSql('DROP TABLE metier');
        $this->addSql('DROP TABLE paiement');
        $this->addSql('DROP TABLE professeur');
        $this->addSql('DROP TABLE professionnel');
        $this->addSql('DROP TABLE professionnel_metier');
        $this->addSql('DROP TABLE responsable');
        $this->addSql('DROP TABLE tarif');
        $this->addSql('DROP TABLE tranche');
        $this->addSql('DROP TABLE type');
        $this->addSql('DROP TABLE type_instrument');
        $this->addSql('DROP TABLE type_instrument_professeur');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
