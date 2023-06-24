import { Controller } from "@hotwired/stimulus"
import * as FilePond from "filepond";
import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
// Get a reference to the file input element
import FilePondPluginImagePreview from "filepond-plugin-image-preview";

// Connects to data-controller="file-pond"
export default class extends Controller {
  connect() {
    const inputElement = document.getElementById("post_photos");
    document.addEventListener("turbo:load", () => {
      FilePond.registerPlugin(
        FilePondPluginImagePreview,
        FilePondPluginFileValidateType
      );
      // Create a FilePond instance
      const pond = FilePond.create(inputElement, {
        credits: {},
        storeAsFile: true,
        allowMultiple: true,
        allowReorder: true,
        acceptedFileTypes: ["image/*"],
      });
    });
  }
}
