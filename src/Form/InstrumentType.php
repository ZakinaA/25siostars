<?php

namespace App\Form;

use App\Entity\Couleur;
use App\Entity\Instrument;
use App\Entity\Marque;
use App\Entity\TypeInstrument;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InstrumentType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('numSerie', null, ['label' => 'Numéro de série '])
            ->add('dateAchat', null, ['label' => 'Date d\'achat '])
            ->add('prixAchat', null, ['label' => 'Prix d\'achat '])
            ->add('utilisation', null, ['label' => 'Utilisation (Local/Prêt/Emprunté) '])
            ->add('cheminImage', null, ['label' => 'Chemin de l\'image (à partir de "assets/images") '])
            ->add('idCouleur', EntityType::class, [
                'class' => Couleur::class,
                'choice_label' => 'nom',
                'multiple' => true,
                'label' => 'Couleur(s) ',
            ])
            ->add('idMarque', EntityType::class, [
                'class' => Marque::class,
                'choice_label' => 'libelle',
                'label' => 'Marque ',
            ])
            ->add('idTypeInstrument', EntityType::class, [
                'class' => TypeInstrument::class,
                'choice_label' => 'libelle',
                'label' => 'Type d\'instrument ',
            ])
            ->add('code', null, ['label' => 'Code '])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Instrument::class,
        ]);
    }
}
