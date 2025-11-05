<?php

namespace App\Entity;

use App\Repository\CoursRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CoursRepository::class)]
class Cours
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $libelle = null;

    #[ORM\Column]
    private ?float $ageMini = null;

    #[ORM\Column]
    private ?float $ageMaxi = null;

    #[ORM\Column]
    private ?int $nbPlaces = null;

    #[ORM\Column(type: Types::TIME_MUTABLE)]
    private ?\DateTime $heureDebut = null;

    #[ORM\Column(type: Types::TIME_MUTABLE)]
    private ?\DateTime $heureFin = null;

    #[ORM\ManyToOne(inversedBy: 'cours')]
    private ?Type $type = null;

    #[ORM\ManyToOne(inversedBy: 'cours')]
    private ?Jour $jour = null;

    /**
     * @var Collection<int, inscription>
     */
    #[ORM\OneToMany(targetEntity: inscription::class, mappedBy: 'cours')]
    private Collection $inscription;

    #[ORM\ManyToOne(inversedBy: 'cours')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Professeur $professeur = null;

    #[ORM\ManyToOne(inversedBy: 'cours')]
    #[ORM\JoinColumn(nullable: false)]
    private ?TypeInstrument $typeInstrument = null;

    public function __construct()
    {
        $this->inscription = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLibelle(): ?string
    {
        return $this->libelle;
    }

    public function setLibelle(string $libelle): static
    {
        $this->libelle = $libelle;

        return $this;
    }

    public function getAgeMini(): ?float
    {
        return $this->ageMini;
    }

    public function setAgeMini(float $ageMini): static
    {
        $this->ageMini = $ageMini;

        return $this;
    }

    public function getAgeMaxi(): ?float
    {
        return $this->ageMaxi;
    }

    public function setAgeMaxi(float $ageMaxi): static
    {
        $this->ageMaxi = $ageMaxi;

        return $this;
    }

    public function getnbPlaces(): ?int
    {
        return $this->nbPlaces;
    }

    public function setnbPlaces(int $nbPlaces): static
    {
        $this->nbPlaces = $nbPlaces;

        return $this;
    }

    public function getHeureDebut(): ?\DateTime
    {
        return $this->heureDebut;
    }

    public function setHeureDebut(\DateTime $heureDebut): static
    {
        $this->heureDebut = $heureDebut;

        return $this;
    }

    public function getHeureFin(): ?\DateTime
    {
        return $this->heureFin;
    }

    public function setHeureFin(\DateTime $heureFin): static
    {
        $this->heureFin = $heureFin;

        return $this;
    }

    public function getType(): ?Type
    {
        return $this->type;
    }

    public function setType(?Type $type): static
    {
        $this->type = $type;

        return $this;
    }

    public function getJour(): ?Jour
    {
        return $this->jour;
    }

    public function setJour(?Jour $jour): static
    {
        $this->jour = $jour;

        return $this;
    }

    /**
     * @return Collection<int, inscription>
     */
    public function getInscription(): Collection
    {
        return $this->inscription;
    }

    public function addInscription(inscription $inscription): static
    {
        if (!$this->inscription->contains($inscription)) {
            $this->inscription->add($inscription);
            $inscription->setCours($this);
        }

        return $this;
    }

    public function removeInscription(inscription $inscription): static
    {
        if ($this->inscription->removeElement($inscription)) {
            // set the owning side to null (unless already changed)
            if ($inscription->getCours() === $this) {
                $inscription->setCours(null);
            }
        }

        return $this;
    }

    public function getIdProfesseur(): ?Professeur
    {
        return $this->professeur;
    }

    public function setIdProfesseur(?Professeur $professeur): static
    {
        $this->professeur = $professeur;

        return $this;
    }

    public function getIdTypeInstrument(): ?TypeInstrument
    {
        return $this->typeInstrument;
    }

    public function setIdTypeInstrument(?TypeInstrument $typeInstrument): static
    {
        $this->typeInstrument = $typeInstrument;

        return $this;
    }
}
