<?php

namespace App\Entity;

use App\Repository\TarifRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: TarifRepository::class)]
class Tarif
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column]
    private ?float $montant = null;

    /**
     * @var Collection<int, type>
     */
    #[ORM\OneToMany(targetEntity: type::class, mappedBy: 'tarif')]
    private Collection $type;

    /**
     * @var Collection<int, tranche>
     */
    #[ORM\OneToMany(targetEntity: tranche::class, mappedBy: 'tarif')]
    private Collection $Tranche;

    public function __construct()
    {
        $this->type = new ArrayCollection();
        $this->tranche = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getMontant(): ?float
    {
        return $this->montant;
    }

    public function setMontant(float $montant): static
    {
        $this->montant = $montant;

        return $this;
    }

    /**
     * @return Collection<int, type>
     */
    public function getType(): Collection
    {
        return $this->type;
    }

    public function addType(type $type): static
    {
        if (!$this->type->contains($type)) {
            $this->type->add($type);
            $type->setTarif($this);
        }

        return $this;
    }

    public function removeType(type $type): static
    {
        if ($this->type->removeElement($type)) {
            // set the owning side to null (unless already changed)
            if ($type->getTarif() === $this) {
                $type->setTarif(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, tranche>
     */
    public function getTranche(): Collection
    {
        return $this->tranche;
    }

    public function addTranche(tranche $tranche): static
    {
        if (!$this->tranche->contains($tranche)) {
            $this->tranche->add($tranche);
            $tranche->setTarif($this);
        }

        return $this;
    }

    public function removeTranche(tranche $tranche): static
    {
        if ($this->tranche->removeElement($tranche)) {
            // set the owning side to null (unless already changed)
            if ($tranche->getTarif() === $this) {
                $tranche->setTarif(null);
            }
        }

        return $this;
    }
}
