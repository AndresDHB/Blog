<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    {{-- JQUERY --}}
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    {{-- Font Awesone --}}
    <script src="https://kit.fontawesome.com/55048bf831.js" crossorigin="anonymous"></script>

    {{-- Sweet alert 2 --}}
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <!-- Styles -->
    @livewireStyles

    @stack('css')
</head>

<body class="font-sans antialiased sm:overflow-auto" :class="{ 'overflow-hidden': open }" x-data="{
    open: false,
    photo: false,
}">

    @include('layouts.includes.admin.nav')

    @include('layouts.includes.admin.sidebar')


    <div class="p-4 sm:ml-64">
        <div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700 mt-14">
            {{ $slot }}
        </div>
    </div>


    <div x-show="open" x-on:click="open = false" style="display: none"
        class="bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-30 sm:hidden">

        @stack('modals')

        @livewireScripts

        @if (session('sweet'))
            <script>
                Swal.fire(@json(session('sweet')));
            </script>
        @endif
        @stack('js')
</body>
</html>
