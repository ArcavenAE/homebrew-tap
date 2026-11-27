class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261127.210518.38e5b40"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-210518-38e5b40/marvel-darwin-arm64"
    sha256 "9a23686dbb0eb3227eb7421f84c3daeb792cf996aa3ec9e06f3b7c20b3b84b08"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-210518-38e5b40/marvel-darwin-amd64"
    sha256 "a0e454c006fa754c59b692c317a62f1183809ae055dfc0e1ef8ba9df480d6246"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-210518-38e5b40/marvel-linux-arm64"
    sha256 "2cd5e831802d278f0271ff80ca1b3f77d8848e085b86a1aab12a7386c0dff3a9"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261127-210518-38e5b40/marvel-linux-amd64"
    sha256 "0452dc957c596fa5acee4b57c3522da7bd194bff29e81dfa1bad942830c3a2a7"
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
