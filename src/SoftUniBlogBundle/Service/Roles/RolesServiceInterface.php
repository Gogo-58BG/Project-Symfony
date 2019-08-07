<?php


namespace SoftUniBlogBundle\Service\Roles;


interface RolesServiceInterface
{
    public function findOneBy(string $criteria);
}