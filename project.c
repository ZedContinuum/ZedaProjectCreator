#include "project.h"

int main (int argc, char *argv[]) {
  GtkBuilder *builder;
  GObject *window;
  GObject *Button;

  gtk_init (&argc, &argv);

  //Load the Resources
  g_resources_register(Resources_get_resource());

  //Create a builder using the Resource
  builder = gtk_builder_new_from_resource ("/project/MainWindow.ui");

  //Activate the Window
  window = gtk_builder_get_object( builder, "MainWindow");
  g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

  //Activate the Cancel Button
  Button = gtk_builder_get_object( builder, "CancelButton");
  g_signal_connect(Button, "clicked", G_CALLBACK(gtk_main_quit), NULL);

  //Main Loop
  gtk_main ();

  return 0;
}
