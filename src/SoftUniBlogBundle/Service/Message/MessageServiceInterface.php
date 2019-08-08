<?php


namespace SoftUniBlogBundle\Service\Message;

use SoftUniBlogBundle\Entity\Message;

interface MessageServiceInterface
{
    public function create(Message $message, int $recipientId):bool;


    public function getAllByUser();
    public function getOne(int $id):?Message;
    public function getAllUnseenByUser();
    public function delete(Message $message):bool;
}