{ "collection" :
    {
        "title" : "Articulos Database",
            "type" : "index",
            "version" : "1.0",
            "href" : "{{ path_for('index')}}",
      
            "links" : [
                {"rel" : "profile" , "href" : "http://schema.org/Book","prompt":"Perfil"}
            ],
      
            "items" : [
                {
                    "href" : "{{ path_for('index') }}/{{ item.id }}",
                        "data" : [
                            {"name" : "nombre", "value" : "{{ item.name }}", "prompt" : "Nombre del artículo"},
                            {"name" : "precio", "value" : "{{ item.description }}", "prompt" : "Precio del artículo"},
                            {"name" : "codigo", "value" : "{{ item.isbn }}", "prompt" : "Código del artículo"},
                            {"name" : "grupo", "value" : "{{ item.image }}", "prompt" : "Grupo"}
                        ]
                        } 
	  
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




