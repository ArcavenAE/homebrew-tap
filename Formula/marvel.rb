class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260928.042158.2cbf0de"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042158-2cbf0de/marvel-darwin-arm64"
    sha256 "606d3fbea744ceee1efc741349a29271be2429286f2c9cb94f4aa1e0314c34c9"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042158-2cbf0de/marvel-darwin-amd64"
    sha256 "4d4eff176ea910e6059d0749b5e3933481d669efdcf29c04e39d15ddad868101"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042158-2cbf0de/marvel-linux-arm64"
    sha256 "884b1f12fc42b577d1ec10d5f4e4d509850a984addb93c0d2587922f351226b9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260928-042158-2cbf0de/marvel-linux-amd64"
    sha256 "a56c0053a53f991b7c2b86ebb11ea5927e204017b18a151382838b4b46c4201c"
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
