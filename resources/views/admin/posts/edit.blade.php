<x-admin-layout>
    @push('css')
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    @endpush
    <h1 class="text-3xl text-gray-600 text-center mb-4 font-bold">Editar Articulo</h1>
    <div class="mb-5">
        <x-validation-errors />
    </div>
    <div>
        <form action="{{ route('admin.posts.update', $post) }}" method="post" enctype="multipart/form-data"
            onchange="previewImage(event, '#imgPreview')">
            @csrf
            @method('PUT')
            <div class="mb-6 relative">
                <figure>
                    <img class="aspect-[16/9] object-cover object-center w-full" src="{{ $post->image }}"
                        alt="{{ $post->titulo }}" id="imgPreview">
                </figure>

                <div class="absolute top-8 right-8">
                    <label class="bg-white rounded-lg cursor-pointer p-2">
                        <i class="fa-solid fa-camera mx-1"></i>
                        Actualizar Imagen
                        <input accept="image/*" hidden type="file" name="image">
                    </label>
                </div>
            </div>
            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Titulo del articulo:') }}" />
                <x-input class="w-full" name="titulo" value="{{ old('titulo', $post->titulo) }}"
                    placeholder="escriba el titulo del post" />
            </div>
            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Slug:') }}" />
                <x-input class="w-full" name="slug" value="{{ old('slug', $post->slug) }}" />
            </div>
            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Categoria:') }}" />
                <x-select class="w-full" name="category_id">
                    <option value="" selected disabled>--Seleccionar categoria--</option>
                    @foreach ($categories as $category)
                        <option @selected(old('category_id', $post->category_id) == $category->id) value="{{ $category->id }}">{{ $category->nombre }}
                        </option>
                    @endforeach
                </x-select>
            </div>

            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Etiquetas:') }}" />
                <select class="select2" name="tags[]" multiple="multiple" style="width: 100%">
                    @foreach ($post->tags as $tag)
                        <option selected value="{{ $tag->id }}">{{ $tag->nombre }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Body:') }}" />
                <x-textarea class="w-full" name="cuerpo" rows="8">
                    {{ old('resumen', $post->cuerpo) }}
                </x-textarea>
            </div>

            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Resumen:') }}" />
                <x-textarea class="w-full" name="resumen" rows="3">
                    {{ old('resumen', $post->resumen) }}
                </x-textarea>
            </div>

            <div class="flex justify-start">
                <label class="inline-flex items-center cursor-pointer">
                    <input type="hidden" value="0" name="publicado">
                    <input type="checkbox" value="1" name="publicado" class="sr-only peer"
                        @checked(old('publicado', $post->publicado == 1))>
                    <div
                        class="relative w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600">
                    </div>
                    <span class="ms-3 text-sm font-medium text-gray-900 dark:text-gray-300">Publicado</span>
                </label>
            </div>

            <div class="flex justify-end gap-4">
                <x-button onclick="deletePost()" type="button"
                    class="bg-red-400 hover:bg-red-600 focus:bg-red-700 active:bg-red-900">
                    Eliminar
                </x-button>

                <x-button class="bg-green-500">
                    Actualizar
                </x-button>
            </div>
        </form>

        <form id="formCategoryPost" action="{{ route('admin.posts.destroy', $post) }}" method="post">
            @csrf
            @method('DELETE')
        </form>
    </div>

    @push('js')
        <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

        <script>
            $(document).ready(function() {
                $('.select2').select2({
                    ajax: {
                        url: '{{ route('admin.tags') }}',
                        dataType: 'json',
                        processResults: function(data) {
                            return {
                                results: $.map(data, function(categoria) {
                                    return {
                                        id: categoria.id,
                                        text: categoria.nombre
                                    };
                                })
                            };
                        }
                    }
                });
            });
        </script>
        <script>
            function deletePost() {
                let form = $('#formCategoryPost');

                Swal.fire({
                    title: "Eliminar Articulo?",
                    text: "Esta accion no puede revertirse!",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#3085d6",
                    cancelButtonColor: "#d33",
                    confirmButtonText: "Si, eliminar!",
                    cancelButtonText: "Cancelar"
                }).then((result) => {
                    if (result.isConfirmed) {
                        form.submit();
                    }
                });
            }
        </script>
        <script>
            function previewImage(event, querySelector) {

                //Recuperamos el input que desencadeno la acción
                const input = event.target;

                //Recuperamos la etiqueta img donde cargaremos la imagen
                $imgPreview = document.querySelector(querySelector);

                // Verificamos si existe una imagen seleccionada
                if (!input.files.length) return

                //Recuperamos el archivo subido
                file = input.files[0];

                //Creamos la url
                objectURL = URL.createObjectURL(file);

                //Modificamos el atributo src de la etiqueta img
                $imgPreview.src = objectURL;

            }
        </script>
    @endpush
</x-admin-layout>
