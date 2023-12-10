<?php

namespace App\Controller;

use App\Entity\Form;
use App\Form\CropFormType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class BlogController extends AbstractController
{
    #[Route('/blog', name: 'app_blog')]
    public function index(): Response
    {
        return $this->render('blog/index.html.twig', [
            'controller_name' => 'BlogController',
        ]);
    }

    #[Route('/search', name: 'app_search')]
    public function search(): Response
    {
        return $this->render('blog/search.html.twig', [
            'controller_name' => 'BlogController',
        ]);
    }
    #[Route('/form', name: 'app_form')]
    public function form(Request $request): Response
    {
        $form = new Form();
        $formulaire = $this->createForm(CropFormType::class, $form);
        return $this->render('blog/new.html.twig', [
            'form' => $formulaire,
        ]);
    }
}
