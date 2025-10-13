<?php

namespace App\Entity;

use App\Repository\InscrptionRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: InscrptionRepository::class)]
class Inscrption
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    /**
     * @var Collection<int, paiement>
     */
    #[ORM\OneToMany(targetEntity: paiement::class, mappedBy: 'inscrption')]
    private Collection $paiement;

    public function __construct()
    {
        $this->paiement = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return Collection<int, paiement>
     */
    public function getPaiement(): Collection
    {
        return $this->paiement;
    }

    public function addPaiement(paiement $paiement): static
    {
        if (!$this->paiement->contains($paiement)) {
            $this->paiement->add($paiement);
            $paiement->setInscrption($this);
        }

        return $this;
    }

    public function removePaiement(paiement $paiement): static
    {
        if ($this->paiement->removeElement($paiement)) {
            // set the owning side to null (unless already changed)
            if ($paiement->getInscrption() === $this) {
                $paiement->setInscrption(null);
            }
        }

        return $this;
    }
}
