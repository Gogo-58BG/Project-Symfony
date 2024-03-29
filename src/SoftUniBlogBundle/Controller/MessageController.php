<?php

namespace SoftUniBlogBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Security;
use SoftUniBlogBundle\Entity\Message;
use SoftUniBlogBundle\Form\MessageType;
use SoftUniBlogBundle\Service\Message\MessageServiceInterface;
use SoftUniBlogBundle\Service\Users\UserServiceInterface;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MessageController extends Controller
{
    /**
     * @var MessageServiceInterface
     */
    private $messageService;

    /**
     * @var UserServiceInterface
     */
    private $userService;

    public function __construct(MessageServiceInterface $messageService,
                                UserServiceInterface $userService)
    {
        $this->messageService = $messageService;
        $this->userService = $userService;
    }


    /**
     * @Route("/user/{id}/message/create", name="message_create", methods={"POST"})
     * @param Request $request
     * @param $id
     * @return Response
     * @Security("is_granted('IS_AUTHENTICATED_FULLY')")
     */
    public function create(Request $request, $id)
    {
        $message = new Message();
        $form = $this->createForm(MessageType::class, $message);
        $form->handleRequest($request);

        $this->messageService->create($message, $id);
        $this->addFlash("message", "Message sent successfully!");

        return $this->redirectToRoute('user_message', ["id" => $id]);
    }

    /**
     * @Route("/user/mailbox", name="user_mailbox", methods={"GET"})
     * @return Response
     * @Security("is_granted('IS_AUTHENTICATED_FULLY')")
     */
    public function getAllByUser()
    {
        return $this->render("users/mailbox.html.twig",
            [
                "messages" => $this->messageService->getAllByUser()
            ]);
    }

    /**
     * @Route("/user/mailbox/message/{id}", name="user_mailbox_message", methods={"GET"})
     * @param int $id
     * @return Response
     * @Security("is_granted('IS_AUTHENTICATED_FULLY')")
     */
    public function view(int $id)
    {
        $message = $this->messageService->getOne($id);
        $message->setIsSeen(true);
        $em = $this->getDoctrine()->getManager();
        $em->persist($message);
        $em->flush();

        return $this->render("messages/view.html.twig",
            [
                "msg" => $this->messageService->getOne($id)
            ]);
    }

    /**
     * @Route("/user/mailbox/message/{id}", name="user_mailbox_send_message", methods={"POST"})
     * @param Request $request
     * @param int $id
     * @return RedirectResponse
     * @Security("is_granted('IS_AUTHENTICATED_FULLY')")
     */
    public function sendMessageToSender(Request $request, int $id)
    {
        $message = new Message();
        $form = $this->createForm(MessageType::class, $message);
        $form->handleRequest($request);
        $messageId = $request->get("msgId");
        $senderId = $id;
        $this->messageService->create($message, $senderId);
        $this->addFlash("message", "Message sent successfully!");

        return $this->redirectToRoute('user_mailbox_message',
            [
                "id" => intval($messageId),
                "msg" => $this->messageService->getOne($messageId)
            ]);
    }

    /**
     * @Route("/delete/message/{id}", name="message_delete", methods={"GET"})
     *
     * @Security("is_granted('IS_AUTHENTICATED_FULLY')")
     *
     * @param Request $request
     * @param $id
     * @return Response
     */
    public function delete(int $id)
    {
        $message = $this->messageService->getOne($id);

        if(null === $message){
            return $this->redirectToRoute("blog_index");
        }

        return $this->render('messages/delete.html.twig',
            ["form" => $this->createForm(MessageType::class)
                ->createView(),
                "message" => $message]);
    }

    /**
     * @Route("/delete/message/{id}", methods={"POST"})
     *
     * @Security("is_granted('IS_AUTHENTICATED_FULLY')")
     *
     * @param Request $request
     * @param $id
     * @return Response
     */
    public function deleteProcess(Request $request, int $id)
    {
        $message = $this->messageService->getOne($id);

        $form = $this->createForm(MessageType::class, $message);
        //$form->remove("imageURL");
        $form->handleRequest($request);
        $this->messageService->delete($message);
        return $this->redirectToRoute("blog_index");
    }
}
