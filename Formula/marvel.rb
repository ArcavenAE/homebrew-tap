class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.181554.01279a4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-181554-01279a4/marvel-darwin-arm64"
    sha256 "a34ab0ccfab853defff1f3f93279acf23528d87af10e7ad31bad75f13b2ad2df"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-181554-01279a4/marvel-darwin-amd64"
    sha256 "3b7a220fc17fcc6e8c01d75c64a12a7ffa720817474fbd36b7c24b4b0208ad14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-181554-01279a4/marvel-linux-arm64"
    sha256 "9ebb3608388a9119f39e022a4c0ca765b3d09532b06494cdf4ee56baa1cd8a0e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-181554-01279a4/marvel-linux-amd64"
    sha256 "7f1eaf98309792e53ef62e8912c3554dee0ebd2e6b6064a5e113850e05b6af97"
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
