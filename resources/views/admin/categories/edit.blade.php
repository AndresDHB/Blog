<x-admin-layout>
    <div>
        <h2 class="text-3xl text-gray-600 text-center mb-4">Agregar Categorias</h2>
    </div>
    <div>
        <x-validation-errors />
    </div>
    <form action="{{ route('admin.categories.update', $category) }}" method="post"
        class="bg-white rounded-lg p-6 shadow-lg">
        @csrf
        @method('PUT')
        <x-label value="{{ __('Nombre') }}" />
        <x-input class="w-full" name="nombre" value="{{ $category->nombre }}"
            placeholder="escriba el nombre de la categoria" />

        <div class="flex justify-end mt-4 gap-4">
            <x-button onclick="deleteCategory()" type="button" class="bg-red-400 hover:bg-red-600 focus:bg-red-700 active:bg-red-900">
                Eliminar
            </x-button>
            <x-button class="bg-green-400 hover:bg-green-600">
                Actualizar
            </x-button>

        </div>
    </form>

    <form id="formCategoryDelete" action="{{ route('admin.categories.destroy', $category) }}" method="post">
        @csrf
        @method('DELETE')
    </form>

    @push('js')
        <script>
            function deleteCategory(){
                let form = $('#formCategoryDelete');
                form.submit();
                
            }
        </script>
    @endpush


</x-admin-layout>
