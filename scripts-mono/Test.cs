using Godot;

namespace GDUnit;

public class Test
{
	static Test()
	{
		GDS.Cache("../scripts/Test.gd");
	}

	private Test(){}

	public static void RunAllTests()
	{
		GD.Print("Running Tests!");
	}

	public static void NotNull(Variant value)
	{
		GDS.Call("not_null", value);
	}

	public static void Equal(Variant expected, Variant actual)
	{
		GDS.Call("not_null", expected, actual);
	}
}