class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260922.025608.98dda6f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-025608-98dda6f/marvel-darwin-arm64"
    sha256 "c923dfcf5ade1e24c84f8641f16006f5f65a1346ae64c2ed91c5eb83f8f8b8be"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-025608-98dda6f/marvel-darwin-amd64"
    sha256 "63855864cec60f0181c66f9daca40483144d6aee8e360e01bea9d4ec638286ea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-025608-98dda6f/marvel-linux-arm64"
    sha256 "3ecbf136406388a5a28adb30418296f974c8f2f4d9e07c23234794ed1014a4fe"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260922-025608-98dda6f/marvel-linux-amd64"
    sha256 "3d30e35cba6788eefa9209ea46df462852589a69ce3cb39ce1914d1d2b1d8234"
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
