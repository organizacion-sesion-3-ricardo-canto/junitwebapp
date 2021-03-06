{ "collection" :
    {
        "title" : "Articulos Database",
            "type" : "articulo",
            "version" : "1.0",
            "href" : "{{ path_for('articulos')}}",
      
            "links" : [
                {"rel" : "profile" , "href" : "http://schema.org/Book","prompt":"Perfil"}
            ],
      
            "items" : [
		{% for item in items %}

               {
                    "href" : "{{ path_for('articulos') }}/{{ item.id }}",
                        "data" : [
                            {"name" : "nombre", "value" : "{{ item.name }}", "prompt" : "Nombre del artículo"}
                        ]
                        } {% if not loop.last %},{% endif %}
	  
	  	{% endfor %}
            ],
      
            "template" : {
            "data" : [
                {"name" : "nombre", "value" : "", "prompt" : "Nombre del artículo"},
                {"name" : "precio", "value" : "", "prompt" : "Precio del artículo"},
                {"name" : "codigo", "value" : "", "prompt" : "Código del artículo"},
                {"name" : "grupo", "value" : "", "prompt" : "Grupo"}        
            ]
                }
    } 
}




