#include "project.h"

int main (int argc, char *argv[]) {
  GtkBuilder *builder;
  GObject *window;
  GObject *quitButton;
  GResource *resource;

  gtk_init (&argc, &argv);

  resource = Resources_get_resource();
  g_resources_register(resource);
  /* Construct a GtkBuilder instance and load our UI description */

  builder = gtk_builder_new_from_resource ("/project/MainWindow.ui");

  window = gtk_builder_get_object( builder, "MainWindow");
  g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

  quitButton = gtk_builder_get_object( builder, "CancelButton");
  g_signal_connect(quitButton, "clicked", G_CALLBACK(gtk_main_quit), NULL);

  gtk_main ();

  return 0;
}
