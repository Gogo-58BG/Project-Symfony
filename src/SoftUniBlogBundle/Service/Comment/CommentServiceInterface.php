<?php


namespace SoftUniBlogBundle\Service\Comment;


use SoftUniBlogBundle\Entity\Comment;

interface CommentServiceInterface
{
    public function create(Comment $comment, int $articleId):bool;

    /**
     * @param int $articleId
     * @return Comment[]
     */
    public function getAllByArticleId(int $articleId);
    public function getOne(int $id):?Comment;

    public function delete($comment);
}