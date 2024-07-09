<x-admin-layout>
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg p-3">
        <h1 class="text-3xl text-gray-600 text-center mb-4">Crear Posts</h1>
        <div class="flex justify-end mb-7">
            <a href="{{ route('admin.posts.create') }}"
                class="text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-2.5 
            me-2 dark:bg-gray-800 dark:hover:bg-gray-700 dark:focus:ring-gray-700 dark:border-gray-700 cursor-pointer">
                Nuevo Posts
            </a>
        </div>
        <ul class="space-y-8">
            @foreach ($posts as $post)
                <li class="grid xl:grid-cols-2 gap-4">
                    <div class="flex justify-center xl:justify-normal">
                        <img class="aspect-[16/9] object-cover object-center w-full" src="{{ $post->image }}"
                            alt="{{ $post->titulo }}">
                    </div>
                    <div>
                        <h2 class="text-3xl font-semibold">{{ $post->titulo }}</h2>
                        <div class="mt-4">
                            {!! $post->publicado == 1
                                ? '<span class="bg-blue-100 text-blue-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-blue-900 dark:text-blue-300">Publicado</span>'
                                : '<span class="bg-red-100 text-red-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-red-900 dark:text-red-300">Borrador</span>' !!}
                        </div>

                        <div class="mt-4">
                            {{ Str::limit($post->resumen, 200) }}
                        </div>
                        

                        <div class="mt-4">
                            @if ($post->publicado_at)
                            <span class="text-sm text-gray-400 font-bold">Publicado hace: </span><span class="text-sm text-gray-400">{{$post->publicado_at->diffForHumans()}}</span>
                            @endif
                        </div>

                        <div class="flex justify-center xl:justify-end mt-4">
                            <a class="focus:outline-none text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800"
                                href="{{ route('admin.posts.edit', $post) }}">
                                Editar
                            </a>
                        </div>
                    </div>
                </li>
            @endforeach

        </ul>
        <div>
            {{$posts->links()}}
        </div>
    </div>

</x-admin-layout>
