class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260418.011358.ca52de6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-011358-ca52de6/marvel-darwin-arm64"
    sha256 "6c516026f5277c220911b17659a2eea8fcadfc80d2a1ee565351e307270a9402"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-011358-ca52de6/marvel-darwin-amd64"
    sha256 "4e8a10f0ee2a0b587a936da0051772b92d9bff20a26f72515490296a148d159c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-011358-ca52de6/marvel-linux-arm64"
    sha256 "bac16bb16478a7f73c2261414ced1879ace673bfb581c9bd5afedf9f08331a1a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260418-011358-ca52de6/marvel-linux-amd64"
    sha256 "3251a656f3c4e77f18cb888bc5f85abe9893062c33ec4541602f7aa8a77bbf0a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
