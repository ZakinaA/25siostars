<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\CoreExtension;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;
use Twig\TemplateWrapper;

/* instrument/show.html.twig */
class __TwigTemplate_d43cee056d8e8c78a323716d950ac482 extends Template
{
    private Source $source;
    /**
     * @var array<string, Template>
     */
    private array $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->blocks = [
            'title' => [$this, 'block_title'],
            'body' => [$this, 'block_body'],
        ];
    }

    protected function doGetParent(array $context): bool|string|Template|TemplateWrapper
    {
        // line 1
        return "base.html.twig";
    }

    protected function doDisplay(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        $__internal_5a27a8ba21ca79b61932376b2fa922d2 = $this->extensions["Symfony\\Bundle\\WebProfilerBundle\\Twig\\WebProfilerExtension"];
        $__internal_5a27a8ba21ca79b61932376b2fa922d2->enter($__internal_5a27a8ba21ca79b61932376b2fa922d2_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "template", "instrument/show.html.twig"));

        $__internal_6f47bbe9983af81f1e7450e9a3e3768f = $this->extensions["Symfony\\Bridge\\Twig\\Extension\\ProfilerExtension"];
        $__internal_6f47bbe9983af81f1e7450e9a3e3768f->enter($__internal_6f47bbe9983af81f1e7450e9a3e3768f_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "template", "instrument/show.html.twig"));

        $this->parent = $this->load("base.html.twig", 1);
        yield from $this->parent->unwrap()->yield($context, array_merge($this->blocks, $blocks));
        
        $__internal_5a27a8ba21ca79b61932376b2fa922d2->leave($__internal_5a27a8ba21ca79b61932376b2fa922d2_prof);

        
        $__internal_6f47bbe9983af81f1e7450e9a3e3768f->leave($__internal_6f47bbe9983af81f1e7450e9a3e3768f_prof);

    }

    // line 3
    /**
     * @return iterable<null|scalar|\Stringable>
     */
    public function block_title(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        $__internal_5a27a8ba21ca79b61932376b2fa922d2 = $this->extensions["Symfony\\Bundle\\WebProfilerBundle\\Twig\\WebProfilerExtension"];
        $__internal_5a27a8ba21ca79b61932376b2fa922d2->enter($__internal_5a27a8ba21ca79b61932376b2fa922d2_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "block", "title"));

        $__internal_6f47bbe9983af81f1e7450e9a3e3768f = $this->extensions["Symfony\\Bridge\\Twig\\Extension\\ProfilerExtension"];
        $__internal_6f47bbe9983af81f1e7450e9a3e3768f->enter($__internal_6f47bbe9983af81f1e7450e9a3e3768f_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "block", "title"));

        yield "Instrument";
        
        $__internal_6f47bbe9983af81f1e7450e9a3e3768f->leave($__internal_6f47bbe9983af81f1e7450e9a3e3768f_prof);

        
        $__internal_5a27a8ba21ca79b61932376b2fa922d2->leave($__internal_5a27a8ba21ca79b61932376b2fa922d2_prof);

        yield from [];
    }

    // line 5
    /**
     * @return iterable<null|scalar|\Stringable>
     */
    public function block_body(array $context, array $blocks = []): iterable
    {
        $macros = $this->macros;
        $__internal_5a27a8ba21ca79b61932376b2fa922d2 = $this->extensions["Symfony\\Bundle\\WebProfilerBundle\\Twig\\WebProfilerExtension"];
        $__internal_5a27a8ba21ca79b61932376b2fa922d2->enter($__internal_5a27a8ba21ca79b61932376b2fa922d2_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "block", "body"));

        $__internal_6f47bbe9983af81f1e7450e9a3e3768f = $this->extensions["Symfony\\Bridge\\Twig\\Extension\\ProfilerExtension"];
        $__internal_6f47bbe9983af81f1e7450e9a3e3768f->enter($__internal_6f47bbe9983af81f1e7450e9a3e3768f_prof = new \Twig\Profiler\Profile($this->getTemplateName(), "block", "body"));

        // line 6
        yield "    <h1>Instrument</h1>

    <table class=\"table\">
        <tbody>
            <tr>
                <th>Id</th>
                <td>";
        // line 12
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 12, $this->source); })()), "id", [], "any", false, false, false, 12), "html", null, true);
        yield "</td>
            </tr>
            <tr>
                <th>Code</th>
                <td>";
        // line 16
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 16, $this->source); })()), "code", [], "any", false, false, false, 16), "html", null, true);
        yield "</td>
            </tr>
            <tr>
                <th>Type d'instrument</td>
                <td>";
        // line 20
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 20, $this->source); })()), "idTypeInstrument", [], "any", false, false, false, 20), "libelle", [], "any", false, false, false, 20), "html", null, true);
        yield "</td>
            </tr>
            <tr>
                <th>Marque</td>
                <td>";
        // line 24
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 24, $this->source); })()), "idMarque", [], "any", false, false, false, 24), "libelle", [], "any", false, false, false, 24), "html", null, true);
        yield "</td>
            </tr>
            <tr>
                <th>Numéro de série</th>
                <td>";
        // line 28
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 28, $this->source); })()), "numSerie", [], "any", false, false, false, 28), "html", null, true);
        yield "</td>
            </tr>
            <tr>
                <th>Date d'achat</th>
                <td>";
        // line 32
        yield (((($tmp = CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 32, $this->source); })()), "dateAchat", [], "any", false, false, false, 32)) && $tmp instanceof Markup ? (string) $tmp : $tmp)) ? ($this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Twig\Extension\CoreExtension']->formatDate(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 32, $this->source); })()), "dateAchat", [], "any", false, false, false, 32), "Y-m-d"), "html", null, true)) : (""));
        yield "</td>
            </tr>
            <tr>
                <th>Prix d'achat</th>
                <td>";
        // line 36
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 36, $this->source); })()), "prixAchat", [], "any", false, false, false, 36), "html", null, true);
        yield "€</td>
            </tr>
            <tr>
                <th>Utilisation</th>
                <td>";
        // line 40
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 40, $this->source); })()), "utilisation", [], "any", false, false, false, 40), "html", null, true);
        yield "</td>
            </tr>
            <tr>
                <th>Couleurs</th>
                <table><tbody><td>|</td>
                ";
        // line 45
        $context['_parent'] = $context;
        $context['_seq'] = CoreExtension::ensureTraversable(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 45, $this->source); })()), "idCouleur", [], "any", false, false, false, 45));
        $context['_iterated'] = false;
        foreach ($context['_seq'] as $context["_key"] => $context["couleur"]) {
            // line 46
            yield "                    <td>";
            yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, $context["couleur"], "nom", [], "any", false, false, false, 46), "html", null, true);
            yield " |</td>
                ";
            $context['_iterated'] = true;
        }
        // line 47
        if (!$context['_iterated']) {
            // line 48
            yield "                    <tr>
                        <td colspan=\"7\">Aucune couleur trouvée</td>
                    </tr>
                ";
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_key'], $context['couleur'], $context['_parent'], $context['_iterated']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 52
        yield "                </tbody></table>
            </tr>
        </tbody>
    </table>
    <img src=\"";
        // line 56
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape(CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 56, $this->source); })()), "cheminImage", [], "any", false, false, false, 56), "html", null, true);
        yield "\" /></br>

    <a href=\"";
        // line 58
        yield $this->extensions['Symfony\Bridge\Twig\Extension\RoutingExtension']->getPath("app_instrument_index");
        yield "\">back to list</a>

    <a href=\"";
        // line 60
        yield $this->env->getRuntime('Twig\Runtime\EscaperRuntime')->escape($this->extensions['Symfony\Bridge\Twig\Extension\RoutingExtension']->getPath("app_instrument_edit", ["id" => CoreExtension::getAttribute($this->env, $this->source, (isset($context["instrument"]) || array_key_exists("instrument", $context) ? $context["instrument"] : (function () { throw new RuntimeError('Variable "instrument" does not exist.', 60, $this->source); })()), "id", [], "any", false, false, false, 60)]), "html", null, true);
        yield "\">edit</a>

    ";
        // line 62
        yield Twig\Extension\CoreExtension::include($this->env, $context, "instrument/_delete_form.html.twig");
        yield "
";
        
        $__internal_6f47bbe9983af81f1e7450e9a3e3768f->leave($__internal_6f47bbe9983af81f1e7450e9a3e3768f_prof);

        
        $__internal_5a27a8ba21ca79b61932376b2fa922d2->leave($__internal_5a27a8ba21ca79b61932376b2fa922d2_prof);

        yield from [];
    }

    /**
     * @codeCoverageIgnore
     */
    public function getTemplateName(): string
    {
        return "instrument/show.html.twig";
    }

    /**
     * @codeCoverageIgnore
     */
    public function isTraitable(): bool
    {
        return false;
    }

    /**
     * @codeCoverageIgnore
     */
    public function getDebugInfo(): array
    {
        return array (  209 => 62,  204 => 60,  199 => 58,  194 => 56,  188 => 52,  179 => 48,  177 => 47,  170 => 46,  165 => 45,  157 => 40,  150 => 36,  143 => 32,  136 => 28,  129 => 24,  122 => 20,  115 => 16,  108 => 12,  100 => 6,  87 => 5,  64 => 3,  41 => 1,);
    }

    public function getSourceContext(): Source
    {
        return new Source("{% extends 'base.html.twig' %}

{% block title %}Instrument{% endblock %}

{% block body %}
    <h1>Instrument</h1>

    <table class=\"table\">
        <tbody>
            <tr>
                <th>Id</th>
                <td>{{ instrument.id }}</td>
            </tr>
            <tr>
                <th>Code</th>
                <td>{{ instrument.code }}</td>
            </tr>
            <tr>
                <th>Type d'instrument</td>
                <td>{{ instrument.idTypeInstrument.libelle }}</td>
            </tr>
            <tr>
                <th>Marque</td>
                <td>{{ instrument.idMarque.libelle }}</td>
            </tr>
            <tr>
                <th>Numéro de série</th>
                <td>{{ instrument.numSerie }}</td>
            </tr>
            <tr>
                <th>Date d'achat</th>
                <td>{{ instrument.dateAchat ? instrument.dateAchat|date('Y-m-d') : '' }}</td>
            </tr>
            <tr>
                <th>Prix d'achat</th>
                <td>{{ instrument.prixAchat }}€</td>
            </tr>
            <tr>
                <th>Utilisation</th>
                <td>{{ instrument.utilisation }}</td>
            </tr>
            <tr>
                <th>Couleurs</th>
                <table><tbody><td>|</td>
                {% for couleur in instrument.idCouleur %}
                    <td>{{ couleur.nom }} |</td>
                {% else %}
                    <tr>
                        <td colspan=\"7\">Aucune couleur trouvée</td>
                    </tr>
                {% endfor %}
                </tbody></table>
            </tr>
        </tbody>
    </table>
    <img src=\"{{ instrument.cheminImage }}\" /></br>

    <a href=\"{{ path('app_instrument_index') }}\">back to list</a>

    <a href=\"{{ path('app_instrument_edit', {'id': instrument.id}) }}\">edit</a>

    {{ include('instrument/_delete_form.html.twig') }}
{% endblock %}", "instrument/show.html.twig", "D:\\wamp2024\\www\\emusic\\templates\\instrument\\show.html.twig");
    }
}
