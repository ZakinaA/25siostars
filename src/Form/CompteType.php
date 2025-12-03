<?php

namespace App\Form;

use App\Entity\Compte;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\CallbackTransformer;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class CompteType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('identifiant')
            ->add('roles', ChoiceType::class, [
                'choices' => [
                    'Elève' => ["role_eleve"],
                    'Professeur' => ["role_professeur"],
                    'Gestionnaire' => ["role_gestionnaire"],
                ],
                'choice_label' => function ($choice, string $key, mixed $value): TranslatableMessage|string {
                    if (["role_eleve"] === $choice) {
                        return 'Elève';
                    }
                    if (["role_professeur"] === $choice) {
                        return 'Professeur';
                    }
                    if (["role_gestionnaire"] === $choice) {
                        return 'Gestionnaire';
                    }

                    return strtoupper($key);
                },
            ])
            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez entrer un mot de passe',
                    ]),
                    new Length([
                        'min' => 3, // mettre à 12
                        'minMessage' => 'Votre mot de passe doit contenir au moins {{ limit }} caractères',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
                'label' => 'Mot de passe ',
            ])
        ;

        $builder->get('roles')
            ->addModelTransformer(new CallbackTransformer(
                function ($tagsAsArray): string {
                    // transform the array to a string
                    return implode(', ', $tagsAsArray);
                },
                function ($tagsAsString): array {
                    // transform the string back to an array
                    return explode(', ', $tagsAsString);
                }
            ))
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Compte::class,
        ]);
    }
}
