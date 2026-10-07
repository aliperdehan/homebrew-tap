class Pdfmd < Formula
  include Language::Python::Virtualenv

  desc "Markdown to a good-looking PDF: a Pandoc wrapper with smart defaults"
  homepage "https://github.com/aliperdehan/pdfmd"
  url "https://files.pythonhosted.org/packages/3d/52/d7cd39321190031170e7038c4f727eeb81113003694158a1a2d3753c48f8/pdfmd_cli-3.21.5.tar.gz"
  sha256 "697775c0014e28a3046a0f34d506a147a0980d3f04c0e6a673d520b88eba092a"
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
