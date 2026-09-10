component output="false" {
    /**
     * Builds the small, page-specific JSON-LD graph used by the public templates.
     * Keep claims here tied to copy that appears on the corresponding page.
     */
    public string function buildPageGraph(
        required string pageKind,
        required string language,
        required string url,
        required string title,
        required string description
    ) output="false" {
        var siteUrl = "https://coldfusionexpert.ar/";
        var isEs = arguments.language eq "es";
        var graph = [];
        var organization = {
            "@type": "Organization",
            "@id": siteUrl & "##organization",
            "name": "ColdFusion Expert",
            "url": siteUrl,
            "logo": "https://coldfusionexpert.ar/assets/images/cf%20expert.png",
            "email": "flavio.di.virgilio@gmail.com",
            "telephone": "+5492236026142",
            "sameAs": [
                "https://www.linkedin.com/in/coldfusion-expert/",
                "https://www.upwork.com/freelancers/coldfusionexpert"
            ]
        };
        var person = {
            "@type": "Person",
            "@id": siteUrl & "##person",
            "name": "Flavio Di Virgilio",
            "url": siteUrl,
            "image": "https://coldfusionexpert.ar/assets/images/flavio-ondas-sin-marco.png",
            "email": "flavio.di.virgilio@gmail.com",
            "telephone": "+5492236026142",
            "sameAs": organization.sameAs
        };

        arrayAppend(graph, organization);
        arrayAppend(graph, person);

        if (arguments.pageKind eq "home") {
            arrayAppend(graph, {
                "@type": "WebSite",
                "@id": siteUrl & "##website",
                "url": siteUrl,
                "name": "ColdFusion Expert",
                "inLanguage": arguments.language,
                "publisher": {"@id": organization["@id"]}
            });
            arrayAppend(graph, {
                "@type": "ProfessionalService",
                "@id": siteUrl & "##professional-service",
                "name": isEs ? "ColdFusion Expert — Flavio Di Virgilio" : "ColdFusion Expert — Flavio Di Virgilio",
                "url": arguments.url,
                "description": arguments.description,
                "provider": {"@id": person["@id"]},
                "areaServed": "Worldwide",
                "knowsAbout": ["ColdFusion", "CFML", "Lucee", "SQL Server", "APIs", "legacy application modernization", "AI automation"]
            });
        } else if (arguments.pageKind eq "profile") {
            person["jobTitle"] = isEs ? "Desarrollador Senior Full-Stack ColdFusion y Administrador AWS" : "Senior Full-Stack ColdFusion Developer and AWS Administrator";
            person["knowsAbout"] = ["ColdFusion", "CFML", "Lucee", "AWS", "SQL Server", "APIs", "WordPress", "React.js", "Node.js", "PHP", "Python", "AI automation"];
            arrayAppend(graph, {"@type": "ProfilePage", "@id": arguments.url & "##webpage", "url": arguments.url, "name": arguments.title, "description": arguments.description, "inLanguage": arguments.language, "mainEntity": {"@id": person["@id"]}});
        } else if (arguments.pageKind eq "coldfusion-service") {
            arrayAppend(graph, {
                "@type": "Service",
                "@id": arguments.url & "##service",
                "name": isEs ? "Desarrollo, soporte y modernización ColdFusion" : "ColdFusion development, support and modernization",
                "description": arguments.description,
                "url": arguments.url,
                "provider": {"@id": person["@id"]},
                "areaServed": "Worldwide",
                "serviceType": isEs ? "Desarrollo y soporte de aplicaciones CFML" : "CFML application development and support"
            });
            arrayAppend(graph, buildColdFusionFaq(arguments.url, isEs));
        } else if (arguments.pageKind eq "ai-search-service") {
            arrayAppend(graph, {
                "@type": "Service",
                "@id": arguments.url & "##service",
                "name": isEs ? "SEO técnico y GEO (Generative Engine Optimization)" : "Technical SEO and GEO (Generative Engine Optimization)",
                "description": arguments.description,
                "url": arguments.url,
                "provider": {"@id": person["@id"]},
                "areaServed": "Worldwide",
                "serviceType": isEs ? "Auditoría e implementación de SEO técnico" : "Technical SEO audit and implementation"
            });
            arrayAppend(graph, buildAiSearchFaq(arguments.url, isEs));
        } else if (arguments.pageKind eq "tools") {
            arrayAppend(graph, {"@type": "CollectionPage", "@id": arguments.url & "##webpage", "url": arguments.url, "name": arguments.title, "description": arguments.description, "inLanguage": arguments.language, "publisher": {"@id": organization["@id"]}});
        }

        if (arguments.pageKind neq "profile" && arguments.pageKind neq "tools") {
            arrayAppend(graph, {"@type": "WebPage", "@id": arguments.url & "##webpage", "url": arguments.url, "name": arguments.title, "description": arguments.description, "inLanguage": arguments.language, "isPartOf": {"@id": siteUrl & "##website"}, "about": {"@id": organization["@id"]}});
        }
        return serializeJSON({"@context": "https://schema.org", "@graph": graph});
    }

    private struct function buildColdFusionFaq(required string url, required boolean isEs) output="false" {
        var questions = arguments.isEs ? [
            ["¿Soportás aplicaciones ColdFusion heredadas?", "Sí. Mantengo, diagnostico, refactorizo y amplío aplicaciones Adobe ColdFusion existentes, incluso codebases antiguos."],
            ["¿Trabajás con Lucee?", "Sí. Lucee Server y el soporte de aplicaciones CFML forman parte de mi experiencia principal."],
            ["¿Podés actualizar una aplicación ColdFusion antigua?", "Sí. Puedo evaluar la aplicación, detectar riesgos de compatibilidad y planificar una actualización a una versión soportada de Adobe ColdFusion o Lucee."],
            ["¿Podés mejorar una aplicación ColdFusion lenta?", "Sí. Puedo investigar el comportamiento de la aplicación, las consultas, la infraestructura y el código para identificar mejoras prácticas de rendimiento."],
            ["¿Podés integrar una aplicación ColdFusion con APIs externas?", "Sí. Trabajo con APIs REST, proveedores de pago, CRMs, servicios cloud e interfaces JavaScript."],
            ["¿Ofrecés soporte continuo?", "Sí. Se pueden coordinar mantenimiento, resolución de incidentes y mejoras planificadas según las necesidades de la aplicación."]
        ] : [
            ["Do you support legacy ColdFusion applications?", "Yes. I maintain, debug, refactor, and extend existing Adobe ColdFusion applications, including older codebases."],
            ["Do you work with Lucee?", "Yes. Lucee Server and CFML application support are part of my core experience."],
            ["Can you upgrade an older ColdFusion application?", "Yes. I can assess the application, identify compatibility risks, and plan an upgrade path to a supported Adobe ColdFusion or Lucee version."],
            ["Can you improve a slow ColdFusion application?", "Yes. I can investigate application behavior, database queries, infrastructure, and code to identify practical performance improvements."],
            ["Can you integrate a ColdFusion application with third-party APIs?", "Yes. I work with REST APIs, payment providers, CRMs, cloud services, and JavaScript interfaces."],
            ["Do you provide ongoing support?", "Yes. Ongoing maintenance, issue resolution, and planned improvements can be arranged around the application’s needs."]
        ];
        var entities = [];
        var pair = [];
        for (pair in questions) {
            arrayAppend(entities, {"@type": "Question", "name": pair[1], "acceptedAnswer": {"@type": "Answer", "text": pair[2]}});
        }
        return {"@type": "FAQPage", "@id": arguments.url & "##faq", "mainEntity": entities};
    }

    private struct function buildAiSearchFaq(required string url, required boolean isEs) output="false" {
        var questions = arguments.isEs ? [
            ["¿Qué incluye una auditoría de SEO técnico y visibilidad para IA?", "Reviso rastreo, indexación, URLs, metadatos, datos estructurados, enlaces internos, contenido HTML y señales que ayudan a buscadores y asistentes a entender el sitio."],
            ["¿Podés garantizar aparecer en respuestas de ChatGPT o Google AI?", "No. Ningún proveedor puede garantizar una cita o posición. El servicio mejora la claridad técnica y semántica del sitio, sin prometer resultados que dependen de plataformas externas."],
            ["¿Sirve para sitios que no usan ColdFusion?", "Sí. Los principios aplican a sitios y aplicaciones existentes en distintas tecnologías; el alcance técnico se adapta a la arquitectura real."],
            ["¿Implementás los cambios después de la auditoría?", "Sí. La auditoría puede entregarse como plan priorizado o convertirse en una implementación técnica acordada para el sitio existente."]
        ] : [
            ["What does a technical SEO and AI visibility audit include?", "I review crawling, indexation, URLs, metadata, structured data, internal links, HTML content, and signals that help search engines and assistants understand the site."],
            ["Can you guarantee appearance in ChatGPT or Google AI answers?", "No. No provider can guarantee a citation or ranking. The service improves technical and semantic clarity without promising outcomes controlled by external platforms."],
            ["Does this work for sites that do not use ColdFusion?", "Yes. The principles apply to existing sites and applications in different technologies; the technical scope follows the real architecture."],
            ["Can you implement the changes after the audit?", "Yes. The audit can be delivered as a prioritized plan or turned into an agreed technical implementation for the existing site."]
        ];
        var entities = [];
        var pair = [];
        for (pair in questions) arrayAppend(entities, {"@type": "Question", "name": pair[1], "acceptedAnswer": {"@type": "Answer", "text": pair[2]}});
        return {"@type": "FAQPage", "@id": arguments.url & "##faq", "mainEntity": entities};
    }
}
