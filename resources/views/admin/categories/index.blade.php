<x-admin-layout>

    @php
        $cont = 0;
    @endphp

    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <h2 class="text-3xl text-gray-600 text-center mb-4">Categorias</h2>
        <div class="flex justify-end">
            <a href="{{route('admin.categories.create')}}"
            class="text-white mb-4 bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 
            me-2 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700 cursor-pointer">
                Nueva Categoria
            </a>
        </div>
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr class="text-center">
                    <th scope="col" class="px-6 py-3">
                        No.
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Nombre
                    </th>

                    <th scope="col" class="px-6 py-3">
                        Accion
                    </th>
                </tr>
            </thead>
            <tbody>
                @foreach ($categories as $category)
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 text-center">
                        <th scope="row"
                            class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            {{$cont+=1}}
                        </th>
                        <td class="px-6 py-4">
                            {{$category->nombre}}
                        </td>
                        <td class="px-6 py-4">
                            <a href="{{route('admin.categories.edit', $category)}}"
                                class="font-medium text-blue-600 dark:text-blue-500 hover:underline"><i class="fa-solid fa-pen-to-square"></i></a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <div>
        {{$categories->links()}}
    </div>


</x-admin-layout>
