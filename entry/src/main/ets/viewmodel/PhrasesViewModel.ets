import { PhraseModel, PHRASES_GROUPS } from '../model/PhraseModel'
import { Resolve } from '../registry/ServiceRegistry';
import LocaleManager from '../utils/LocaleManager';
import { AppLocale } from '../model/AppLocale';
import { PhrasesDataSource } from './PhrasesDataSource';

@Observed
export class PhrasesViewModel {
  @Resolve(LocaleManager)
  localManager?: LocaleManager;

  private readonly dataSource: PhrasesDataSource = new PhrasesDataSource(PHRASES_GROUPS);

  public loadPhrases(): PhraseModel[] {
    return PHRASES_GROUPS;
  }

  public loadDataSource(): PhrasesDataSource {
    return this.dataSource;
  }

  public get appLocale() {
    return this.localManager?.appLocale;
  }

  public toggleLocale() {
    this.localManager?.toggleLocale();
  }

  public setOnLocaleChanged(callback: (locale: AppLocale) => void): void {
    this.localManager?.setOnLocaleChanged(callback);
  }

  public clearOnLocaleChanged(): void {
    this.localManager?.clearOnLocaleChanged();
  }
}


