import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Connected!");
  }

  async downloadPdf() {
    console.log("Button Clicked!");
    const editorContent = $(".trix-content").html();

    console.log("editorContent", editorContent);

    try {
      const response = await fetch("/patient_information/generate_pdf.pdf", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content"),
        },
        body: JSON.stringify({ html_content: editorContent }),
      });

      if (!response.ok) {
        throw new Error(`HTTP error! Status: ${response.status}`);
      }

      // Convert the blob to a PDF file and trigger download
      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
      const a = document.createElement("a");
      a.href = url;
      a.download = "patient_information.pdf";
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      window.URL.revokeObjectURL(url);
    } catch (error) {
      console.error("Error generating PDF:", error);
    }
  }
}
