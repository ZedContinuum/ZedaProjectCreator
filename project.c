#include "project.h"

int main (int argc, char *argv[]) {
  GtkBuilder *builder;
  GObject *window;
  GObject *quitButton;

  gtk_init (&argc, &argv);

  /* Construct a GtkBuilder instance and load our UI description */
  builder = gtk_builder_new ();
  gtk_builder_add_from_file (builder, "ui/MainWindow.ui", NULL);

  window = gtk_builder_get_object( builder, "MainWindow");
  g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

  quitButton = gtk_builder_get_object( builder, "CancelButton");
  g_signal_connect(quitButton, "clicked", G_CALLBACK(gtk_main_quit), NULL);

  gtk_main ();

  return 0;
}
