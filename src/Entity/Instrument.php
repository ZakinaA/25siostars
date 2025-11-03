<?php

namespace App\Entity;

use App\Repository\InstrumentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InstrumentRepository::class)]
class Instrument
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(nullable: true)]
    private ?int $numSerie = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTime $dateAchat = null;

    #[ORM\Column(nullable: true)]
    private ?int $prixAchat = null;

    #[ORM\Column(length: 50, nullable: true)]
    private ?string $utilisation = null;

    #[ORM\Column(length: 200, nullable: true)]
    private ?string $cheminImage = null;

    /**
     * @var Collection<int, Couleur>
     */
    #[ORM\ManyToMany(targetEntity: Couleur::class, inversedBy: 'instruments')]
    private Collection $idCouleur;

    #[ORM\ManyToOne(inversedBy: 'instruments')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Marque $marque = null;

    /**
     * @var Collection<int, Accessoire>
     */
    #[ORM\OneToMany(targetEntity: Accessoire::class, mappedBy: 'instrument')]
    private Collection $idAccessoire;

    #[ORM\ManyToOne(inversedBy: 'instruments')]
    #[ORM\JoinColumn(nullable: false)]
    private ?TypeInstrument $typeInstrument = null;

    /**
     * @var Collection<int, Intervention>
     */
    #[ORM\OneToMany(targetEntity: Intervention::class, mappedBy: 'instrument')]
    private Collection $idIntervention;

    /**
     * @var Collection<int, ContratPret>
     */
    #[ORM\OneToMany(targetEntity: ContratPret::class, mappedBy: 'instrument')]
    private Collection $idContratPret;

    #[ORM\Column(length: 12)]
    private ?string $code = null;

    public function __construct()
    {
        $this->idCouleur = new ArrayCollection();
        $this->idAccessoire = new ArrayCollection();
        $this->idIntervention = new ArrayCollection();
        $this->idContratPret = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNumSerie(): ?int
    {
        return $this->numSerie;
    }

    public function setNumSerie(?int $numSerie): static
    {
        $this->numSerie = $numSerie;

        return $this;
    }

    public function getDateAchat(): ?\DateTime
    {
        return $this->dateAchat;
    }

    public function setDateAchat(?\DateTime $dateAchat): static
    {
        $this->dateAchat = $dateAchat;

        return $this;
    }

    public function getPrixAchat(): ?int
    {
        return $this->prixAchat;
    }

    public function setPrixAchat(?int $prixAchat): static
    {
        $this->prixAchat = $prixAchat;

        return $this;
    }

    public function getUtilisation(): ?string
    {
        return $this->utilisation;
    }

    public function setUtilisation(?string $utilisation): static
    {
        $this->utilisation = $utilisation;

        return $this;
    }

    public function getCheminImage(): ?string
    {
        return $this->cheminImage;
    }

    public function setCheminImage(?string $cheminImage): static
    {
        $this->cheminImage = $cheminImage;

        return $this;
    }

    /**
     * @return Collection<int, Couleur>
     */
    public function getIdCouleur(): Collection
    {
        return $this->idCouleur;
    }

    public function addIdCouleur(Couleur $idCouleur): static
    {
        if (!$this->idCouleur->contains($idCouleur)) {
            $this->idCouleur->add($idCouleur);
        }

        return $this;
    }

    public function removeIdCouleur(Couleur $idCouleur): static
    {
        $this->idCouleur->removeElement($idCouleur);

        return $this;
    }

    public function getIdMarque(): ?Marque
    {
        return $this->marque;
    }

    public function setIdMarque(?Marque $marque): static
    {
        $this->marque = $marque;

        return $this;
    }

    /**
     * @return Collection<int, Accessoire>
     */
    public function getIdAccessoire(): Collection
    {
        return $this->idAccessoire;
    }

    public function addIdAccessoire(Accessoire $idAccessoire): static
    {
        if (!$this->idAccessoire->contains($idAccessoire)) {
            $this->idAccessoire->add($idAccessoire);
            $idAccessoire->setInstrument($this);
        }

        return $this;
    }

    public function removeIdAccessoire(Accessoire $idAccessoire): static
    {
        if ($this->idAccessoire->removeElement($idAccessoire)) {
            // set the owning side to null (unless already changed)
            if ($idAccessoire->getInstrument() === $this) {
                $idAccessoire->setInstrument(null);
            }
        }

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

    /**
     * @return Collection<int, Intervention>
     */
    public function getIdIntervention(): Collection
    {
        return $this->idIntervention;
    }

    public function addIdIntervention(Intervention $idIntervention): static
    {
        if (!$this->idIntervention->contains($idIntervention)) {
            $this->idIntervention->add($idIntervention);
            $idIntervention->setInstrument($this);
        }

        return $this;
    }

    public function removeIdIntervention(Intervention $idIntervention): static
    {
        if ($this->idIntervention->removeElement($idIntervention)) {
            // set the owning side to null (unless already changed)
            if ($idIntervention->getInstrument() === $this) {
                $idIntervention->setInstrument(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, ContratPret>
     */
    public function getIdContratPret(): Collection
    {
        return $this->idContratPret;
    }

    public function addIdContratPret(ContratPret $idContratPret): static
    {
        if (!$this->idContratPret->contains($idContratPret)) {
            $this->idContratPret->add($idContratPret);
            $idContratPret->setInstrument($this);
        }

        return $this;
    }

    public function removeIdContratPret(ContratPret $idContratPret): static
    {
        if ($this->idContratPret->removeElement($idContratPret)) {
            // set the owning side to null (unless already changed)
            if ($idContratPret->getInstrument() === $this) {
                $idContratPret->setInstrument(null);
            }
        }

        return $this;
    }

    public function getCode(): ?string
    {
        return $this->code;
    }

    public function setCode(string $code): static
    {
        $this->code = $code;

        return $this;
    }
}
