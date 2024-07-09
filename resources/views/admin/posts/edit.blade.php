<x-admin-layout>
    <h1 class="text-3xl text-gray-600 text-center mb-4">Editar Articulo</h1>
    <div class="mb-5">
        <x-validation-errors />
    </div>
    <div>
        <form action="{{ route('admin.posts.update', $post) }}" method="post">
            @csrf
            @method('PUT')
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
                    <input type="checkbox" value="1" name="publicado" class="sr-only peer" @checked(old('publicado', $post->publicado == 1))>
                    <div
                        class="relative w-11 h-6 bg-gray-200 peer-focus:outline-none peer-focus:ring-4 peer-focus:ring-blue-300 dark:peer-focus:ring-blue-800 rounded-full peer dark:bg-gray-700 peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all dark:border-gray-600 peer-checked:bg-blue-600">
                    </div>
                    <span class="ms-3 text-sm font-medium text-gray-900 dark:text-gray-300">Publicado</span>
                </label>

            </div>


            <div class="flex justify-end">
                <x-button class="bg-green-500">
                    Actualizar
                </x-button>
            </div>
        </form>
    </div>
</x-admin-layout>
