#pragma once

#include <string>
#include <algorithm>
#include <set>

namespace Izumi
{
	template<typename T>
	constexpr void Swap(T& a, T& b) { T temp(a); a = b; b = temp; }

	enum class UriToken
	{
		None,
		Scheme,
		Host,
		Port,
		Query,
		Fragment
	};

	struct CharSet
	{
	private:
		std::set<char> s_Set;
	public:
		CharSet(char a)
		{
			s_Set.insert(a);
		}

		CharSet(char a, char b)
		{
			if (a > b)
				Swap(a, b);

			for (char i = a; i < b + 1; ++i)
				s_Set.insert(i);
		}

		inline bool operator[] (char a) { return s_Set.find(a) != s_Set.end(); }
	};

	class Uri
	{
	private:
		struct Properties
		{
			std::string Path, Scheme, Host, Port, Query, Fragment;
			std::set<std::string> UserData;

			bool HasScheme;
		};
		
		Properties m_Props;
	public:
		bool Parse(std::string scheme)
		{
			if (scheme.length() == 0)
				return true;


		}

		inline std::string GetPath() const { return m_Props.Path; }
		inline std::string GetScheme() const { return m_Props.Scheme; }
		inline std::string GetHost() const { return m_Props.Host; }
		inline std::string GetPort() const { return m_Props.Port; }
		inline std::string GetQuery() const { return m_Props.Query; }
		inline std::string GetFragment() const { return m_Props.Fragment; }
	};
}