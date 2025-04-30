using System.Collections.Generic;
using Godot;

namespace GDUnit;

public static class GDS
{
	private readonly static List<Script> CachedScripts = new List<Script>();

	public static void Cache(string filepath)
	{
		CachedScripts.Add(GD.Load<Script>(filepath));
	}

	public static Variant Call(StringName method, params Variant[] @args)
	{
		return Variant.CreateFrom(true);
	}
}