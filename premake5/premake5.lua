workspace "Izumi"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


project "Izumi"
	location "Izumi"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/**.h",
		"%{prj.name}/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "Izumi_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "Izumi_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "Izumi_DIST"
		runtime "Release"
		optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/**.h",
		"%{prj.name}/**.cpp"
	}

	includedirs
	{
		"Izumi/"
	}

	links
	{
		"Izumi"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		defines "Izumi_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		defines "Izumi_RELEASE"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		defines "Izumi_DIST"
		runtime "Release"
		optimize "on"