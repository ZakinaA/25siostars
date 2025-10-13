<?php

namespace App\Entity;

use App\Repository\TrancheRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TrancheRepository::class)]
class Tranche
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $libelle = null;

    #[ORM\Column]
    private ?float $quotientMini = null;

    /**
     * @var Collection<int, responsable>
     */
    #[ORM\OneToMany(targetEntity: responsable::class, mappedBy: 'tranche')]
    private Collection $responsable;

    /**
     * @var Collection<int, eleve>
     */
    #[ORM\OneToMany(targetEntity: eleve::class, mappedBy: 'tranche')]
    private Collection $eleves;

    #[ORM\ManyToOne(inversedBy: 'Tranche')]
    private ?Tarif $tarif = null;

    public function __construct()
    {
        $this->responsable = new ArrayCollection();
        $this->eleves = new ArrayCollection();
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

    public function getQuotientMini(): ?float
    {
        return $this->quotientMini;
    }

    public function setQuotientMini(float $quotientMini): static
    {
        $this->quotientMini = $quotientMini;

        return $this;
    }

    /**
     * @return Collection<int, responsable>
     */
    public function getResponsable(): Collection
    {
        return $this->responsable;
    }

    public function addResponsable(responsable $responsable): static
    {
        if (!$this->responsable->contains($responsable)) {
            $this->responsable->add($responsable);
            $responsable->setTranche($this);
        }

        return $this;
    }

    public function removeResponsable(responsable $responsable): static
    {
        if ($this->responsable->removeElement($responsable)) {
            // set the owning side to null (unless already changed)
            if ($responsable->getTranche() === $this) {
                $responsable->setTranche(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, eleve>
     */
    public function getEleves(): Collection
    {
        return $this->eleves;
    }

    public function addElefe(eleve $elefe): static
    {
        if (!$this->eleves->contains($elefe)) {
            $this->eleves->add($elefe);
            $elefe->setTranche($this);
        }

        return $this;
    }

    public function removeElefe(eleve $elefe): static
    {
        if ($this->eleves->removeElement($elefe)) {
            // set the owning side to null (unless already changed)
            if ($elefe->getTranche() === $this) {
                $elefe->setTranche(null);
            }
        }

        return $this;
    }

    public function getTarif(): ?Tarif
    {
        return $this->tarif;
    }

    public function setTarif(?Tarif $tarif): static
    {
        $this->tarif = $tarif;

        return $this;
    }
}
