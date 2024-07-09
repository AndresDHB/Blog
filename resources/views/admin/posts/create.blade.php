<x-admin-layout>

    <h1 class="text-3xl text-gray-600 text-center mb-4">Crear Nuevo Articulo</h1>
    <div class="mb-5">
        <x-validation-errors />
    </div>
    <div>
        <form action="{{ route('admin.posts.store') }}" method="post" x-data="data()" x-init="$watch('titulo', value => {string_to_slug(value)})">
            @csrf
            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Titulo del articulo:') }}" />
                <x-input class="w-full" name="titulo" value="{{old('titulo')}}" x-model.fill='titulo' placeholder="escriba el titulo del post" />
            </div>
            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Slug:') }}" />
                <x-input class="w-full" name="slug" x-model.fill='slug' value="{{old('slug')}}" />
            </div>
            <div class="mb-4">
                <x-label class="font-bold mb-2 text-3xl" value="{{ __('Categoria:') }}" />
                <x-select class="w-full" name="category_id">
                    <option value="" selected disabled >--Seleccionar categoria--</option>
                    @foreach ($categories as $category)
                        <option @selected(old('category_id') == $category->id) value="{{$category->id}}">{{$category->nombre}}</option>
                    @endforeach
                </x-select>
            </div>
            <div class="flex justify-end">
                <x-button class="bg-blue-500">
                    Agregar
                </x-button>
            </div>
        </form>
    </div>

    @push('js')
    <script>
        function data(){
            return {
                titulo: '',
                slug: '',
                string_to_slug(str){
                    str = str.replace(/^\s+|\s+$/g, '');
                    str = str.toLowerCase();
                    var from = "àáäâèéëêìíïîòóöôùúüûñç·/_,:;";
                    var to = "aaaaeeeeiiiioooouuuunc------";
                    for (var i = 0, l = from.length; i < l; i++) {
                        str = str.replace(new RegExp(from.charAt(i), 'g'), to.charAt(i));
                    }
                    str = str.replace(/[^a-z0-9 -]/g, '')
                        .replace(/\s+/g, '-')
                        .replace(/-+/g, '-');
                    this.slug = str;
                }
            }
        }
    </script>
        
    @endpush
</x-admin-layout>
