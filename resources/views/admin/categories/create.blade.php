<x-admin-layout>
    <div>
        <h1 class="text-3xl text-gray-600 text-center mb-4">Agregar Categorias</h1>
    </div>
    <div>
        <x-validation-errors />
    </div>
    <form action="{{route('admin.categories.store')}}" method="post" class="bg-white rounded-lg p-6 shadow-lg">
        @csrf
        <x-label value="{{ __('Nombre') }}" />
        <x-input class="w-full" name="nombre" placeholder="escriba el nombre de la categoria" />

        <div class="flex justify-end mt-4 gap-4">
            <x-button class="bg-blue-500">
                Agregar
            </x-button>
            
        </div>
    </form>
    
</x-admin-layout>