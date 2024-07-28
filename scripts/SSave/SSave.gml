function SaveFile() : SSave("save") constructor
{
	add_value("score", SSAVE_TYPE.REAL, 0);
	add_value("level", SSAVE_TYPE.REAL, 1);
}