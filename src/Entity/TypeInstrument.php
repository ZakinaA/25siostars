<?php

namespace App\Entity;

use App\Repository\TypeInstrumentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TypeInstrumentRepository::class)]
class TypeInstrument
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $libelle = null;

    /**
     * @var Collection<int, Instrument>
     */
    #[ORM\OneToMany(targetEntity: Instrument::class, mappedBy: 'idTypeInstrument')]
    private Collection $instruments;

    #[ORM\ManyToOne(inversedBy: 'typeInstruments')]
    #[ORM\JoinColumn(nullable: false)]
    private ?ClasseInstrument $classeInstrument = null;

    /**
     * @var Collection<int, Professeur>
     */
    #[ORM\ManyToMany(targetEntity: Professeur::class, inversedBy: 'typeInstruments')]
    private Collection $idProfesseur;

    /**
     * @var Collection<int, Cours>
     */
    #[ORM\OneToMany(targetEntity: Cours::class, mappedBy: 'idTypeInstrument')]
    private Collection $cours;

    public function __construct()
    {
        $this->Instruments = new ArrayCollection();
        $this->Professeur = new ArrayCollection();
        $this->cours = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(?string $libelle): static
    {
        $this->libelle = $libelle;

        return $this;
    }

    /**
     * @return Collection<int, Instrument>
     */
    public function getInstruments(): Collection
    {
        return $this->instruments;
    }

    public function addInstrument(Instrument $instrument): static
    {
        if (!$this->instruments->contains($instrument)) {
            $this->instruments->add($instrument);
            $instrument->setIdTypeInstrument($this);
        }

        return $this;
    }

    public function removeInstrument(Instrument $instrument): static
    {
        if ($this->instruments->removeElement($instrument)) {
            // set the owning side to null (unless already changed)
            if ($instrument->getIdTypeInstrument() === $this) {
                $instrument->setIdTypeInstrument(null);
            }
        }

        return $this;
    }

    public function getIdClasseInstrument(): ?ClasseInstrument
    {
        return $this->classeInstrument;
    }

    public function setIdClasseInstrument(?ClasseInstrument $classeInstrument): static
    {
        $this->classeInstrument = $classeInstrument;

        return $this;
    }

    /**
     * @return Collection<int, Professeur>
     */
    public function getIdProfesseur(): Collection
    {
        return $this->idProfesseur;
    }

    public function addIdProfesseur(Professeur $idProfesseur): static
    {
        if (!$this->idProfesseur->contains($idProfesseur)) {
            $this->idProfesseur->add($idProfesseur);
        }

        return $this;
    }

    public function removeIdProfesseur(Professeur $idProfesseur): static
    {
        $this->idProfesseur->removeElement($idProfesseur);

        return $this;
    }

    /**
     * @return Collection<int, Cours>
     */
    public function getCours(): Collection
    {
        return $this->cours;
    }

    public function addCour(Cours $cour): static
    {
        if (!$this->cours->contains($cour)) {
            $this->cours->add($cour);
            $cour->setIdTypeInstrument($this);
        }

        return $this;
    }

    public function removeCour(Cours $cour): static
    {
        if ($this->cours->removeElement($cour)) {
            // set the owning side to null (unless already changed)
            if ($cour->getIdTypeInstrument() === $this) {
                $cour->setIdTypeInstrument(null);
            }
        }

        return $this;
    }
}
