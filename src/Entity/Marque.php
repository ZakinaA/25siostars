<?php

namespace App\Entity;

use App\Repository\MarqueRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: MarqueRepository::class)]
class Marque
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
    #[ORM\OneToMany(targetEntity: Instrument::class, mappedBy: 'idMarque')]
    private Collection $instruments;

    public function __construct()
    {
        $this->instruments = new ArrayCollection();
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
            $instrument->setIdMarque($this);
        }

        return $this;
    }

    public function removeInstrument(Instrument $instrument): static
    {
        if ($this->instruments->removeElement($instrument)) {
            // set the owning side to null (unless already changed)
            if ($instrument->getIdMarque() === $this) {
                $instrument->setIdMarque(null);
            }
        }

        return $this;
    }
}
