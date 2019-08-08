<?php


namespace SoftUniBlogBundle\Service\Users;


use SoftUniBlogBundle\Entity\Role;
use SoftUniBlogBundle\Entity\User;
use SoftUniBlogBundle\Repository\UserRepository;
use SoftUniBlogBundle\Service\Encryption\ArgonEncryption;
use SoftUniBlogBundle\Service\Encryption\BCryptService;
use SoftUniBlogBundle\Service\Roles\RolesServiceInterface;
use Symfony\Component\Security\Core\Security;

class UserService implements UserServiceInterface
{
    private $security;
    private $userRepository;
    private $encryptionService;
    private $roleService;

    public function __construct(Security $security,
                                UserRepository $userRepository,
                                ArgonEncryption $encryptionService,
                                RolesServiceInterface $rolesService)
    {
        $this->security = $security;
        $this->userRepository = $userRepository;
        $this->encryptionService = $encryptionService;
        $this->roleService = $rolesService;
    }

    /**
     * @param string $email
     * @return User|null|object
     */
    public function findOneByEmail(string $email): ?User
    {
       return $this->userRepository->findOneBy(["email" => $email]);
    }

    public function save(User $user): bool
    {
        $passwordHash =
            $this->encryptionService->hash($user->getPassword());
        $user->setPassword($passwordHash);

        $user->setPassword($passwordHash);
        $userRole = $this->roleService->findOneBy("ROLE_USER");
        $user->addRole($userRole);
        $user->setImage("");
        return $this->userRepository->insert($user);
    }

    /**
     * @param int $id
     * @return User|null|object
     */
    public function findOneById(int $id): ?User
    {
        return $this->userRepository->find($id);
    }

    /**
     * @param User $user
     * @return User|null|object
     */
    public function findOne(User $user): ?User
    {
        return $this->userRepository->find($user);
    }

    /**
     * @return User|null|object
     */
    public function currentUser(): ?User
    {
        return $this->security->getUser();
    }

    public function update(User $user): bool
    {
        return $this->userRepository->update($user);
    }

    public function getAll()
    {
        return $this->userRepository->findAll();
    }
}