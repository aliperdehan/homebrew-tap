class Pdfmd < Formula
  include Language::Python::Virtualenv

  desc "Markdown to a good-looking PDF: a Pandoc wrapper with smart defaults"
  homepage "https://github.com/aliperdehan/pdfmd"
  url "https://files.pythonhosted.org/packages/02/2b/230e4c44ed9fc9aa1757e53e0218853fbf6a7b42a89ae5b6da1b68d7980a/pdfmd_cli-3.26.20.tar.gz"
  sha256 "c64f0983514d17042e6ef8f844e8fd975909b2a54227657f02935884bbda0c94"
  license "MIT"

  depends_on "libyaml"
  depends_on "pandoc"
  depends_on "python@3.13"
  depends_on "typst"

  resource "pypdf" do
    url "https://files.pythonhosted.org/packages/1f/ac/63d71aaedb59acbcdef491e6ca6469165e3771c9c74358204818fd9bc5a6/pypdf-6.19.0.tar.gz"
    sha256 "bbc43aca292369ccc6cbc8a921991ecf2538a3587ab5a116eff06c321d647155"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pdfmd --version")
    (testpath/"t.md").write("# Hello\n\nWorld.\n")
    system bin/"pdfmd", "t.md"
    assert_path_exists testpath/"t.pdf"
  end
end
